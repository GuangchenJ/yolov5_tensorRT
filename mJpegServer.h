#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <netdb.h>
#include <netinet/in.h>
#include <math.h>
#include <signal.h>

//#include <opencv2/core.hpp>
//#include <opencv2/highgui.hpp>

#include <iostream>
#include <string>
#include <fstream>

#define __THROW_SEND_ERROR 1
#define __THROW_SOCKET_ERROR 2
#define __THROW_SET_SOCK_OPT_ERROR 3
#define __THROW_BIND_ERROR 4
#define __THROW_LISTEN_ERROR 5
#define __THROW_ACCEPT_ERROR 6

class mJpegServer{
	private :
	int client;
	int sock;
	struct sockaddr_in addr;
	struct sockaddr_in client_addr;
	socklen_t addr_len = sizeof(addr);
	int bind_port = 8080;
	int on = 1;
	char buffer[1024] = {0,};
	size_t read_len;
	const char * header_packet = "HTTP/1.0 200 OK\r\nServer: EMPOSIII\r\n Connection: close\r\nContent-Type:multipart/x-mixed-replace; boundary=myBoundary\r\n\r\n";
	const char * mjpegHeaderPacket = "--myBoundary\r\nContent-Type: image/jpeg\r\n\r\n";
	char * jpegData;
	unsigned long jpegSize;
	std::ifstream fileJpeg;

	public:
//	void cpJpegData(char * Data, unsigned long Size);
	void openJpegData(std::string fileName);

	void initSocket(int port=8080);
	void createConnetion();
	void closeConnection();
	void closeSocket();

	void sendFrame();
	
};

void mJpegServer::openJpegData(std::string fileName){
    delete[] jpegData;
    fileJpeg.close();

    fileJpeg.open(fileName, std::ios::binary);
//	if (!fileJpeg.is_open()){
//		// throw std::__throw_ios_failure(fileName.c_str());
//	}
//    std::cout<<jpegData<<std::endl;

    fileJpeg.seekg(0, std::ios::end);
    jpegSize = fileJpeg.tellg();
    fileJpeg.seekg(0, std::ios::beg);

    jpegData = new char[jpegSize];
    fileJpeg.read(jpegData,jpegSize);

//    std::cout<<jpegData<<std::endl;
}

void mJpegServer::createConnetion(){

    client = accept(sock, (struct sockaddr*)&client_addr, &addr_len);
    if (client < 0) {
        perror("accept() error");
        throw __THROW_ACCEPT_ERROR;
    }
    // 接受响应
    read_len = recv(client, buffer, sizeof(buffer), 0);

#ifdef DEBUG
    if (read_len > 0) {
		printf("RECV: %s", buffer);
	}
#endif //DEBUG
    // 标题包
    send(client, header_packet, strlen(header_packet), 0);
}

void mJpegServer::closeConnection(){
    close(client);
#ifdef DEBUG
    printf("closeSocket\n");
#endif //DEBUG
}

void mJpegServer::closeSocket(){
    close(sock);
#ifdef DEBUG
    printf("closeSocket\n");
#endif //DEBUG

}

void mJpegServer::initSocket(int port){
    // 以参数设定端口
    bind_port = port;
    sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (sock < 0) {
        perror("socket() error");
        throw __THROW_SOCKET_ERROR;
    }

    if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, (void*)&on, sizeof(on)) != 0) {
        perror("setsockopt() error");
        throw __THROW_SET_SOCK_OPT_ERROR;
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    addr.sin_port = htons(bind_port);
    if (bind(sock, (struct sockaddr*)&addr, addr_len) != 0) {
        perror("bind() error");
        throw __THROW_BIND_ERROR;
    }

    if (listen(sock, 5) != 0) {
        perror("listen() error");
        throw __THROW_LISTEN_ERROR;
    }
    printf("listening... %d\n", bind_port);
}




void mJpegServer::sendFrame(){
    int err;

    err = send(client, mjpegHeaderPacket, strlen(mjpegHeaderPacket), MSG_NOSIGNAL);
    if (err < 0){
        throw __THROW_SEND_ERROR;
    }

    err = send(client, jpegData, jpegSize, MSG_NOSIGNAL);
    if (err < 0){
        throw __THROW_SEND_ERROR;
    }

    err = send(client, "\r\n", strlen("\r\n"), MSG_NOSIGNAL);
    if (err < 0){
        throw __THROW_SEND_ERROR;
    }

}

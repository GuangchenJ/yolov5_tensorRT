# yolov5 TensorRT

基于TensorRT的yolov5模型的视频检测

从摄像头中读取视频然后经过计算后展示，源代码来自于[wang-xinyu/tensorrtx/yolov5](https://github.com/wang-xinyu/tensorrtx/tree/master/yolov5)

模型来自[ultralytics/yolov5](https://github.com/ultralytics/yolov5).

之后会将图片保存到 ./res/ 文件夹下

## 操作步骤：

```$xslt
1. 先从 yolov5{s|l|m|x}.pt 中 生成 yolov5{s|l|m|x}.wts（注意自己修改py文件中的参数）
   
   python gen_wts.py

2. 将生成的 yolov5{s|l|x|m}.wts 放进该文件夹 yolov5/ 中，然后build and run

    mkdir build
    cd build
    cmake ..
    make
    sudo ./yolov5 -s    // serialize model to plan file i.e. 'yolov5s.engine'
    sudo ./yolov5 -d    // deserialize plan file and run inference, the images in samples will be processed.
```
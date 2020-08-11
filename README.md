# yolov5 TensorRT

基于TensorRT的yolov5模型的视频检测

从摄像头中读取视频然后经过计算后展示，源代码来自于[wang-xinyu/tensorrtx/yolov5](https://github.com/wang-xinyu/tensorrtx/tree/master/yolov5)

模型来自[ultralytics/yolov5](https://github.com/ultralytics/yolov5).

之后会将图片保存到 ./res/ 文件夹下

## 操作步骤：

```$xslt
1. 训练自己的yolov5模型

2. 先从 yolov5{s|l|m|x}.pt 中 生成 yolov5{s|l|m|x}.wts（注意自己修改py文件中的参数）
   
   python gen_wts.py
   
3. 更改[static constexpr int CLASS_NUM = 80;](https://github.com/Cocktail98/yolov5_tensorRT/blob/2bf6fbaec971492c646737768b4875bf16415e2b/yololayer.h#L13)中的CLASS_NUM为您yolov5模型的输出大小，如果更改了模型结构，请在对应的[createEngine_s](https://github.com/Cocktail98/yolov5_tensorRT/blob/2bf6fbaec971492c646737768b4875bf16415e2b/yolov5.cpp#L37), [createEngine_m](https://github.com/Cocktail98/yolov5_tensorRT/blob/2bf6fbaec971492c646737768b4875bf16415e2b/yolov5.cpp#L148), [createEngine_l](https://github.com/Cocktail98/yolov5_tensorRT/blob/2bf6fbaec971492c646737768b4875bf16415e2b/yolov5.cpp#L266), [createEngine_x](https://github.com/Cocktail98/yolov5_tensorRT/blob/2bf6fbaec971492c646737768b4875bf16415e2b/yolov5.cpp#L384)中修改对应与yolov5{s|l|m|x}的结构。

4. 将生成的 yolov5{s|l|x|m}.wts 放进该文件夹 yolov5/ 中，然后build and run

    mkdir build
    cd build
    cmake ..
    make
    sudo ./yolov5 -s    // serialize model to plan file i.e. 'yolov5s.engine'
    sudo ./yolov5 -d    // deserialize plan file and run inference, the images in samples will be processed.
```

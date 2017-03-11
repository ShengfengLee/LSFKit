//
//  LSFCamera.h
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface LSFCamera : NSObject

///AVCaptureSession对象来执行输入设备和输出设备之间的数据传递
@property (nonatomic, strong) AVCaptureSession *session;
///当前正在使用的设备
@property (nonatomic, strong) AVCaptureDevice *device;
///输入流
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;
///照片输出流对象，当然我的相机只有拍照功能所以只需要这个对象就够了
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;
///预览图层，来显示照相机拍摄到的画面
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@property(nonatomic, assign) AVCaptureFlashMode flashMode;

- (void)initialSession;

- (void)setUpCameraLayer;
- (void)stopRunning;
- (void)startRunning;
///切换摄像头
- (void)toggleCamera;

///拍照
- (void)captureImageWithCompletionHandle:(void (^)(UIImage *image,
                                                   CMSampleBufferRef imageDataSampleBuffer,
                                                   NSError *error))completionHandle;



///放置预览图层的View
@property (nonatomic, strong) CALayer *containerLayer;
@end

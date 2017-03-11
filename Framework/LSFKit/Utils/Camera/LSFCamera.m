//
//  LSFCamera.m
//  xReader-iOS
//
//  Created by 李胜锋 on 2017/2/16.
//  Copyright © 2017年 李胜锋. All rights reserved.
//

#import "LSFCamera.h"
#import "LSFLog.h"

@implementation LSFCamera

- (void)initialSession{
    self.session = [[AVCaptureSession alloc] init];
    self.device = [self frontCamera];
    self.videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:nil];
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = @{AVVideoCodecKey: AVVideoCodecJPEG};
    [self.stillImageOutput setOutputSettings:outputSettings];
    
    if ([self.session canAddInput:self.videoInput]) {
        [self.session addInput:self.videoInput];
    }
    
    if ([self.session canAddOutput:self.stillImageOutput]) {
        [self.session addOutput:self.stillImageOutput];
    }
}

///这是获取前后摄像头对象的方法
- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == position) {
            return device;
        }
    }
    return nil;
}

///获取前置摄像头
- (AVCaptureDevice *)frontCamera{
    return [self cameraWithPosition:AVCaptureDevicePositionFront];
}

///获取后置摄像头
- (AVCaptureDevice *)backCamera{
    return [self cameraWithPosition:AVCaptureDevicePositionBack];
}

- (void)setUpCameraLayer{
    if (self.previewLayer == nil) {
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
        //        CALayer *viewLayer = [self.cameraShowView layer];
        //        [viewLayer setMasksToBounds:YES];
        
        self.previewLayer.frame = self.containerLayer.bounds;
        [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        //        [self.containerLayer addSublayer:self.previewLayer];
        //        [self.containerLayer.superlayer replaceSublayer:self.containerLayer with:self.previewLayer];
        [self.containerLayer insertSublayer:self.previewLayer atIndex:0];
    }
}

- (void)stopRunning{
    if (self.session) {
        [self.session stopRunning];
    }
}

- (void)startRunning{
    if (self.session) {
        [self.session startRunning];
    }
}

///切换摄像头
- (void)toggleCamera{
    NSUInteger cameraCount = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] count];
    if (cameraCount > 1) {
        NSError *error;
        AVCaptureDeviceInput *newVideoInput;
        AVCaptureDevicePosition position = [[self.videoInput device] position];
        AVCaptureDevice *device;
        if (position == AVCaptureDevicePositionBack){
            device = [self frontCamera];
            newVideoInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
        }
        else if (position == AVCaptureDevicePositionFront){
            device = [self backCamera];
            newVideoInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
        }
        else{
            return;
        }
        
        if (newVideoInput != nil) {
            [self.session beginConfiguration];
            [self.session removeInput:self.videoInput];
            if ([self.session canAddInput:newVideoInput]) {
                [self.session addInput:newVideoInput];
            }
            else{
                [self.session addInput:self.videoInput];
            }
            [self.session commitConfiguration];
            self.videoInput = newVideoInput;
            self.device = device;
            
        }
        else if (error){
            LSFLogE(@"切换摄像头失败，error = %@", error);
        }
    }
}

- (AVCaptureFlashMode)flashMode{
    return self.device.flashMode;
}

- (void)setFlashMode:(AVCaptureFlashMode)flashMode{
    
    //修改前必须先锁定
    [self.device lockForConfiguration:nil];
    
    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if ([self.device hasFlash]) {
        self.device.flashMode = flashMode;
    }
    [self.device unlockForConfiguration];
}

- (void)flashButtonClick{
    //修改前必须先锁定
    [self.device lockForConfiguration:nil];
    
    //必须判定是否有闪光灯，否则如果没有闪光灯会崩溃
    if ([self.device hasFlash]) {
        if (self.device.flashMode == AVCaptureFlashModeOff) {
            self.device.flashMode = AVCaptureFlashModeOn;
        }
        else if (self.device.flashMode == AVCaptureFlashModeOn){
            self.device.flashMode = AVCaptureFlashModeAuto;
        }
        else if (self.device.flashMode == AVCaptureFlashModeAuto){
            self.device.flashMode = AVCaptureFlashModeOff;
        }
    }
    else{
        LSFLogD(@"设备不支持闪光灯");
        //        self.flashButton.hidden = YES;
    }
    [self.device unlockForConfiguration];
}

///拍照
- (void)captureImageWithCompletionHandle:(void (^)(UIImage *image,
                                                   CMSampleBufferRef imageDataSampleBuffer,
                                                   NSError *error))completionHandle{
    AVCaptureConnection *videoConnection = [self.stillImageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        LSFLogE(@"take photo filed");
        return;
    }
    
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            completionHandle(nil, NULL, error);
            return ;
        }
        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage *image = [UIImage imageWithData:imageData];
        
        if (completionHandle) {
            completionHandle(image, imageDataSampleBuffer, error);
        }
    }];
    
}

@end

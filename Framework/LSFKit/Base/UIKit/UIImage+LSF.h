//
//  BBImageUtils.h
//  BBTools
//
//  Created by 李胜锋 on 16/8/1.
//  Copyright © 2016年 YouShiXiu. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>


@interface UIImage (LSF)
/**
 *  将图片裁剪成正方形
 *
 *  @param image   需要裁剪的图片
 *  @param newSize 裁剪后的图片的尺寸， 如果newSize = 0， 则以图片的最小边为新的尺寸
 *
 *  @return 裁剪后的图片
 */
+ (UIImage *)lsf_squareImage:(UIImage *)image
               scaledToSize:(CGFloat)newSize;

/*!
 *  修改image的尺寸
 *
 *  @param newSize 目标尺寸
 *
 *  @return 修改后的图片
 */
+ (UIImage*)lsf_scaledImage:(UIImage *)image
                    toSize:(CGSize)newSize;

//纯色生成图片
+ (UIImage *)lsf_imageFromColor:(UIColor *)color
                         frame:(CGRect)frame;

///图片模糊效果
+ (UIImage *)lsf_imageBlur:(UIImage *)image;

/*
 //get original photo from iOS photos
 //如果该图片大于2M，会自动旋转90度；否则不旋转
 网络上说：用相机拍摄出来的照片含有EXIF信息，UIImage的imageOrientation属性指的就是EXIF中的orientation信息。如果我们忽略orientation信息，而直接对照片进行像素处理或者drawInRect等操作，得到的结果是翻转或者旋转90之后的样子。这是因为我们执行像素处理或者drawInRect等操作之后，imageOrientaion信息被删除了，imageOrientaion被重设为0，造成照片内容和imageOrientaion不匹配。所以，在对照片进行处理之前，先将照片旋转到正确的方向，并且返回的imageOrientaion为0。
 */
+ (UIImage *)lsf_fixOrientation:(UIImage *)image;

/**
 *  获取本地视频的缩略图
 *
 *  @param filePath 本地视频的路径
 *  @param percent  取视频时长的百分比处截图
 *
 *  @return 视频缩略图
 */
+ (UIImage *)lsf_getVideoImageWithFilePath:(NSString *)filePath
                               andPercent:(CGFloat)percent;

/**
 *  截屏，返回截取到的图片
 *
 *  @return UIImage *
 */
+ (UIImage *)lsf_imageWithScreenshot;
@end

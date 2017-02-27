//
//  MCIucencyView.h
//  Hair
//
//  Created by michan on 15/5/26.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCIucencyView : UIView
@property (strong, nonatomic) NSDate *lastPlaySoundDate;

@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView*PaomaView;
/**
 背景颜色
 */
-(void)setBgViewColor:(UIColor*)Color;
/**
 背景透明度
 */
-(void)setBgViewAlpha:(CGFloat)bgViewAlpha;
/**
 星星个数
 */
-(void)setGrade:(NSInteger)page;
/**
 星星个数(大)
 */
-(void)setGradeMax:(NSInteger)page;
/**
 星星个数(右边)
 */
-(void)setGradeR:(NSInteger)page;
/**
 跑马灯
 */
-(void)PaomaView:(NSString*)str;
/**
 UILabel的height
 */
+ (CGFloat) heightForString:(UILabel *)textView andWidth:(CGFloat)width;
/**
 UILabel的width
 */
+ (CGFloat) widthForString:(UILabel *)textView andheight:(CGFloat)height;

/**
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param height 限制字符串显示区域的宽度
 @result float 返回的宽度
 */
+ (CGFloat) heightforString:(NSString *)value andHeight:(CGFloat)height fontSize:(CGFloat)fontSize;

/**
 ios7.0之前适用----
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (CGFloat) heightForString:(NSString *)value fontSize:(CGFloat)fontSize andWidth:(CGFloat)width;
/**
 ios7.0之后适用
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (CGFloat) heightforString:(NSString *)value andWidth:(CGFloat)width fontSize:(CGFloat)fontSize;




/**
 图片模糊化
 */
//加模糊效果，image是图片，blur是模糊度
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur ;

/**
 *  压缩图片的大小(压缩之后图片将会变成jpg,因为jpg压缩图片的效率高于png的效率，故才用jpg的图片压缩方式)
 *  @parameter picData       需要压缩的图片
 *  @parameter compressBytes 指定压缩后的图片大小范围以下(在设置范围的时候最好事先找到最小零界值，因为一旦达到最小零界值就不再会被压缩)
 *
 */
+(NSData *)compressPicQualityWith:(UIImage *)picImage andCompressBytesLow:(int)compressBytesLow;
/**
 *  压缩图片的尺寸
 *  @parameter orignalImage  需要压缩的图片
 *  @parameter compressSize  压缩的尺寸
 */
+(UIImage *)compressPicSizeWithOrignalImage:(UIImage *)orignalImage andCompressSize:(CGSize)compressSize;


@end

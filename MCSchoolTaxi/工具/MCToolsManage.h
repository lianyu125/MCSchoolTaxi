//
//  MCToolsManage.h
//  MCCWYJ
//
//  Created by MC on 16/7/29.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCToolsManage : NSObject

/*!
 @method
 @brief 判断字符是否为Emoji
 @discussion
 @param string 需要判断是否为emoji的字符
 @result 字符是否为Emoji
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/*!
 指定的文本改变颜色
 @method
 @str 整个原字符串
 @acolor 常态颜色
 @afont  文本的font
 @ordinaryColor 要改颜色
 @startnum 起点坐标
 @tonum  结束坐标
 @result butedString
 */

+(NSMutableAttributedString *)formatString:(NSString *)str textColor:(UIColor *)acolor font:(CGFloat )afont textordinaryColor:(UIColor*)ordinaryColor startNum:(NSInteger)startnum toNum:(NSInteger)tonum;

/*!
 @method
 @time 时间戳
 @result NSString(几天前、几小时前、几分钟前、几秒前)
 */

+(NSString*)daysAgoAgainst:(long long)time;
/*!
 @method
 @str
 @result md5加密(大写)
 */

+(NSString *) md5:(NSString *)str;

/*
 是否是车牌号码
 */
+(BOOL) isChePaiHao:(NSString *)cheNum;

//首位是否字母
+ (BOOL) isFirstChr:(NSString*)str;
//是否邮箱地址
+ (BOOL) isEmail:(NSString*)email;
//是否身份证件号码
+ (BOOL) isCardNum:(NSString *)strNum;
//字母数字结合
+ (BOOL) isTranNum:(NSString *)strNum;
//a-z\A-Z\!@#$&
+ (BOOL) isLimitChar:(NSString *)strNum;
//是否手机号码
+ (BOOL) isMobile:(NSString *)strNum;
//是否数字
+ (BOOL) isNumbericString:(NSString *)str;
//电话号码打****
+(NSString *)phonenumbel:(NSString *)num;
//身份号码打****
+(NSString *)Number:(NSString *)num;
//车牌****
+(NSString *)carNumbel:(NSString *)num;
/**
 时间戳转化为NSString
 NSString<-时间戳
 @time  时间戳
 @format @“yyyyMMddHHmmss”、yyyy-MM-dd HH:mm:ss(自定义类型)
 
 */
+(NSString*)getStringWithLong:(long long)time Format:(NSString*)format;
/*
 时间格式化
 NSString->时间戳
 */
+(NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

//间隔天数
+(NSUInteger)daysAgo:(NSDate *) fromdate todate:(NSDate *) todate;
//间隔当前天数
+(NSUInteger)daysAgo:(NSDate *)currdate;

//午夜时间距今几天
+(NSUInteger)daysAgoAgainstMidnight:(NSDate *) mydate;

/**
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param Width 限制字符串显示区域的宽度
 @result float 返回的宽度
 */
+ (CGFloat) heightforString:(NSString *)value andHeight:(CGFloat)height fontSize:(CGFloat)fontSize;
/**
 ios7.0之后适用
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param Width 限制字符串显示区域的宽度
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

// 返回虚线image的方法

+ (UIImage *)drawLineByImageView:(UIImageView *)imageView;
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;



+(NSData *)compressPicQualityWith:(UIImage *)picImage andCompressBytesLow:(int)compressBytesLow;
/**
 *  压缩图片的尺寸
 *  @parameter orignalImage  需要压缩的图片
 *  @parameter compressSize  压缩的尺寸
 */

+(UIImage *)compressPicSizeWithOrignalImage:(UIImage *)orignalImage andCompressSize:(CGSize)compressSize;
/*
 *获取某类的私有变量
 */
-(NSMutableArray *)fromClassStr:(id)Str;
/*
 *str->（字典）对象
 */

+(id)analysis:(NSString*)str;
/*
判断字符串是否
 */
+(BOOL)IsJudgeExistStr:(NSString*)str JudgeStr:(NSString*)judgeStr;



/*
 NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
 
 NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
 
 NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
 
 NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
 
 NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
 
 NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
 
 
 123456789  0
 
 123,456,789     1
 
 ￥123,456,789.00      2
 
 -539,222,988%     3
 
 1.23456789E8    4
 
 一亿二千三百四十五万六千七百八十九    5
 
 
 */


+(NSString*)stringFromNumber:(NSString*)NumberStr NumberStyle:(NSInteger)Styleindex;

/*
 birth   yyyy-mm-dd
 */
+(NSString *)agebirthStr:(NSString*)birth;
//将 &lt 等类似的字符转化为HTML中的“<”等
+ (NSString *)htmlEntityDecode:(NSString *)string;




#pragma mark - 将字符串转化成试图控制器
+ (UIViewController *)StringIntoViewController:(NSString *)classString;


#pragma mark - 验证银行卡号是否规范
+ (BOOL)validateBankCardWithNumber:(NSString *)cardNum;


#pragma mark - 判断身份证号码是否规范
+(BOOL)checkIdentityCardNo:(NSString*)cardNo;


#pragma mark - 拨打电话
+ (void)makePhoneCallWithTelNumber:(NSString *)tel;


#pragma mark - 判断手机号码是否正确
+ (BOOL)isValidateMobileNumber:(NSString *)mobileNum;


#pragma mark - 判断手机号码的运营商类型
+ (NSString *)judgePhoneNumTypeOfMobileNum:(NSString *)mobileNum;


#pragma mark - 直接打开网页
+ (void)openURLWithUrlString:(NSString *)url;


#pragma mark - 获取当前时间
+ (NSString *)currentTime;


#pragma mark - 将时间转换成时间戳
/**
 *  时间戳：指格林威治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总秒数。
 */
+ (NSString *)timeStringIntoTimeStamp:(NSString *)time;


#pragma mark - 将时间戳转换成时间
+ (NSString *)timeStampIntoTimeString:(NSString *)time;


#pragma mark - 通过时间字符串获取年、月、日
+ (NSArray *)getYearAndMonthAndDayFromTimeString:(NSString *)time;


#pragma mark - 获取今天、明天、后天的日期
+ (NSArray *)timeForTheRecentDate;


#pragma mark - 当前界面截图
+ (UIImage *)imageFromCurrentView:(UIView *)view;


#pragma mark - 去掉html中的标签
+ (NSString *)stringRemovetheHTMLtags:(NSString *)htmlString;


#pragma mark - 获取Documents中文件的路径
+ (NSString *)accessToTheDocumentsInTheFilePath:(NSString *)fileName;


#pragma mark - 生成随机数 n到m
+(int)getRandomNumber:(int)from to:(int)to;


#pragma mark - 判断网址是否有效
+ (BOOL)validateHttp:(NSString *)textString;


#pragma mark - 给view设置边框
+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;


#pragma mark - 将数组中重复的对象去除，只保留一个
+ (NSMutableArray *)arrayWithMemberIsOnly:(NSMutableArray *)array;


#pragma mark - 图片大小设置
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;


#pragma mark - 获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;


#pragma mark - 获取当前处于activity状态的view controller
+ (UIViewController *)activityViewController;


#pragma mark - 清空字典数据
+(NSMutableDictionary *)clearNullData:(NSDictionary *)dic;


#pragma mark - 将image 转化成nsdata
+(NSData *)getImageDataWith:(UIImage *)image;


#pragma mark - 格式化千分位
+ (NSString *)positiveFormat:(NSString *)text;


#pragma mark - 不四舍五入  小数
+(NSString *)notRounding:(float)price afterPoint:(int)position;


#pragma mark - 获取用户手机信息
+ (NSMutableDictionary *)getUserPhoneInfo;


#pragma mark - 获取手机品牌型号
+ (NSString *)getUserPhoneModelNumber;


#pragma mark - 转化成手机号空格式字符串
+ (NSString *)becomePhoneNumTypeWithNSString:(NSString *)string;
#pragma mark - app名
+(NSString*)app_Name;



@end

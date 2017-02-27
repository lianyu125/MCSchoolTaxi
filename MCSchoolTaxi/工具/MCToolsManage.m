//
//  MCToolsManage.m
//  MCCWYJ
//
//  Created by MC on 16/7/29.
//  Copyright © 2016年 MC. All rights reserved.
//
#define TIME_ZONE @"Asia/Beijing"

#import "MCToolsManage.h"
#import <Accelerate/Accelerate.h>
#import "sys/utsname.h"

@implementation MCToolsManage



+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}
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

+(NSMutableAttributedString *)formatString:(NSString *)str textColor:(UIColor *)acolor font:(CGFloat )afont textordinaryColor:(UIColor*)ordinaryColor startNum:(NSInteger)startnum toNum:(NSInteger)tonum{
    
    NSMutableAttributedString *btn_arrstring = [[NSMutableAttributedString alloc] initWithString:str];
    
    [btn_arrstring addAttributes:@{NSForegroundColorAttributeName : ordinaryColor,	NSFontAttributeName : [UIFont systemFontOfSize:afont]} range:NSMakeRange(startnum, tonum)];
    return btn_arrstring;
    
}
+(NSString*)daysAgoAgainst:(long long)time{
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time /1000];
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    
    unsigned int unitFlags=NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:confromTimesp toDate:dat options:0];
    //  NSLog(@"%d天%d小时%d分钟%d秒",[d day],[d hour],[d minute],[d second]);
    
    if ([d day]) {
        return [NSString stringWithFormat:@"%ld天前",(long)[d day]];
    }
    else if([d hour])
    {
        return [NSString stringWithFormat:@"%ld小时前",(long)[d hour]];
        
    }
    else if([d minute]){
        return [NSString stringWithFormat:@"%ld分钟前",(long)[d minute]];
        
    }
    else
    {
        return [NSString stringWithFormat:@"%ld秒前",(long)[d second]];
    }
    
    
    
    return @"未知";
}
//md5 encode
+(NSString *) md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02X", digest[i]];
    
    return output;
}
//是否是车牌号码
+(BOOL) isChePaiHao:(NSString *)cheNum
{
    NSString * regex = @"^[京津冀晋蒙辽吉桂黑陕黔秦新琼宁青港藏甘陇蜀云滇沪川粤渝贵台苏浙皖澳闽赣鲁豫鄂楚湘]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{5}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result =  [predicate evaluateWithObject:cheNum];
    
    return result;
}
+(BOOL) isFirstChr:(NSString *)str{
    NSString *regex = @"^([A-Z]|[a-z]){1}$";
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:regex options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberofMatch > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    return NO;
    
}
+ (BOOL) isEmail:(NSString*)email
{
    
    if( (0 != [email rangeOfString:@"@"].length) &&  (0 != [email rangeOfString:@"."].length) )
    {
        NSMutableCharacterSet *invalidCharSet = [[[NSCharacterSet alphanumericCharacterSet] invertedSet]mutableCopy];
        [invalidCharSet removeCharactersInString:@"_-"];
        
        NSRange range1 = [email rangeOfString:@"@" options:NSCaseInsensitiveSearch];
        
        // If username part contains any character other than "."  "_" "-"
        
        NSString *usernamePart = [email substringToIndex:range1.location];
        NSArray *stringsArray1 = [usernamePart componentsSeparatedByString:@"."];
        for (NSString *string in stringsArray1) {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet: invalidCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        NSString *domainPart = [email substringFromIndex:range1.location+1];
        NSArray *stringsArray2 = [domainPart componentsSeparatedByString:@"."];
        
        for (NSString *string in stringsArray2) {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:invalidCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        return YES;
    }
    else // no ''@'' or ''.'' present
        return NO;
}
+ (BOOL) isCardNum:(NSString *)strNum
{
    strNum = [strNum uppercaseString];
    
    if([strNum length]!=15 && [strNum length]!=18)
        return false;
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:@"[0-9]{17}(x|X|[0-9]){1}$" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:strNum options:NSMatchingReportProgress range:NSMakeRange(0, strNum.length)];
    if(numberofMatch > 0)
    {
        char szID[20] = {0};
        memcpy(szID, [strNum UTF8String], 18);
        int wi[17]={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
        char rs[12]={"10X98765432"};
        int iSum = 0;
        for(int i=0;i<17;i++)
        {
            iSum += (szID[i]-'0')*wi[i];
        }
        if(szID[17] == rs[iSum%11])
        {
            return YES;
        }
        return NO;
    }
    else
    {
        return NO;
    }
    return NO;
}
+ (BOOL) isTranNum:(NSString *)strNum{
    
    NSString *testString = strNum;
    NSString *perchar;
    int alength = [testString length];
    
    BOOL isChar = NO;
    BOOL isnum = NO;
    BOOL isnum1 = YES;
    
    for (int i = 0; i<alength; i++) {
        char commitChar = [testString characterAtIndex:i];
        NSString *temp = [testString substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (3==strlen(u8Temp)){
            NSLog(@"字符串中含有中文");
            isnum1 = NO;
            break;
        }
        if((commitChar>64)&&(commitChar<91)){
            NSLog(@"字符串中含有大写英文字母");
            isChar = YES;
            continue;
        }
        if((commitChar>96)&&(commitChar<123)){
            NSLog(@"字符串中含有小写英文字母");
            isChar = YES;
            continue;
            
            
        }
        if((commitChar>47)&&(commitChar<58)){
            NSLog(@"字符串中含有数字");
            isnum = YES;
            continue;
            
            
        }
        else{
            NSLog(@"字符串中含有非法字符%c",commitChar);
            isnum1 = NO;
            break;
            
        }
    }
    
    if ((isnum || isChar)&&isnum1) {
        return YES;
    }
    return NO;
    
    
}
+ (BOOL) isLimitChar:(NSString *)strNum
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:@"^([A-Z]|[a-z]|[0-9]|@|#|$|&|!){1,30}$" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:strNum options:NSMatchingReportProgress range:NSMakeRange(0, strNum.length)];
    if(numberofMatch > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    return NO;
}
+ (BOOL) isMobile:(NSString *)strNum
{

    NSString *regex = @"^((13[0-9])|(14[0-9])|(17[0-9])|(15[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:strNum];
    
    return isMatch;
}
+ (BOOL)isNumbericString:(NSString *)str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^(?:|0|[1-9]\\d{0,})(?:\\.\\d*)?$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    if(numberofMatch > 0)
    {
        return YES;
    }
    return NO;
}
//电话号码打****
+(NSString *)phonenumbel:(NSString *)num{
    if (num.length <11) {
        return  num;
    }
    
    NSMutableString *  str = [NSMutableString stringWithString:num];
    [str deleteCharactersInRange:NSMakeRange(2, 6)];
    [str insertString:@"******" atIndex:2];
    
    return str;
    
    
}
//身份号码打****
+(NSString *)Number:(NSString *)num{
    
    if (num.length <18) {
        return  num;
    }
    
    return [num stringByReplacingCharactersInRange:NSMakeRange(14, 4) withString:@"****"];
    
    
}
//车牌****
+(NSString *)carNumbel:(NSString *)num{
    if (num.length < 1) {
        return @"暂无车牌号";
    }
    if (num.length <3) {
        return  @"***";
    }
    
    NSMutableString *  str = [NSMutableString stringWithString:num];
    [str deleteCharactersInRange:NSMakeRange(num.length - 3, 3)];
    [str insertString:@"***" atIndex:num.length - 3];
    
    return str;
    
    
}
+(NSString*)getStringWithLong:(long long)time Format:(NSString*)format{
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    dateFormatter.dateFormat = format;
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time/1000];
    
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr=nil;
    if(confromTimesp==nil)
        currentDateStr= [dateFormatter stringFromDate:[NSDate date]];
    else
        currentDateStr= [dateFormatter stringFromDate:confromTimesp];
    
    return currentDateStr;
    
    
}
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+(NSUInteger)daysAgo:(NSDate *) fromdate todate:(NSDate *) todate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:fromdate
                                                 toDate:todate
                                                options:0];
    return [components day];
}
//午夜时间距今几天
+ (NSUInteger)daysAgoAgainstMidnight:(NSDate *) mydate
{
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:mydate]];
    
    return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}
+(NSUInteger)daysAgo:(NSDate *) mydate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:mydate
                                                 toDate:[NSDate date]
                                                options:0];
    return [components day];
}
+ (CGFloat) heightforString:(NSString *)value andHeight:(CGFloat)height fontSize:(CGFloat)fontSize{
    if (!value.length) {
        value=@" ";
    }

    return [value boundingRectWithSize:CGSizeMake(100000, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size.width;
    
}
+ (CGFloat) heightforString:(NSString *)value andWidth:(CGFloat)width fontSize:(CGFloat)fontSize{
    if (!value.length) {
        value=@" ";
    }
    return [value boundingRectWithSize:CGSizeMake(width, 1000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size.height;
    
}
//获取某类的私有变量
-(NSMutableArray *)fromClassStr:(id)Str{
    unsigned  int count = 0;
    Ivar *members = class_copyIvarList([Str class], &count);
    NSMutableArray * array =[NSMutableArray array];
    for (int i = 0; i < count; i++)
    {
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        Ivar var = members[i];
        
        const char *memberStr = ivar_getName(var);
        
        const char *member_Type = ivar_getTypeEncoding(var);
        
        NSString *memberName = [NSString stringWithFormat:@"%s",memberStr];
        NSString *memberType = [NSString stringWithFormat:@"%s",member_Type];
        [dic setObject: memberName forKey:@"memberName"];
        [dic setObject: memberType forKey:@"memberType"];
        [array addObject:dic];
        NSLog(@"memberName = %@ ; memberType = %@",memberName,memberType);

    }
    return array;
    
    
}
//加模糊效果，image是图片，blur是模糊度
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    
    //模糊度,
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    boxSize = 45;
    NSLog(@"boxSize:%i",boxSize);//45
    //图像处理
    CGImageRef img = image.CGImage;
    //需要引入
    /*
     This document describes the Accelerate Framework, which contains C APIs for vector and matrix math, digital signal processing, large number handling, and image processing.
     本文档介绍了Accelerate Framework，其中包含C语言应用程序接口（API）的向量和矩阵数学，数字信号处理，大量处理和图像处理。
     */
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}
+ (UIImage *)drawLineByImageView:(UIImageView *)imageView{
    
    
    UIGraphicsBeginImageContext(imageView.frame.size); //开始画线 划线的frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    // 5是每个虚线的长度 1是高度
    CGFloat lengths[] = {5,1};
    CGContextRef line = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetStrokeColorWithColor(line, [UIColor colorWithWhite:0.408 alpha:1.000].CGColor);
    CGContextSetLineDash(line, 0, lengths, 2); //画虚线
    CGContextMoveToPoint(line, 0.0, 2.0); //开始画线
    CGContextAddLineToPoint(line, Main_Screen_Width - 10, 2.0);
    
    CGContextStrokePath(line);
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];


}


+(NSData *)compressPicQualityWith:(UIImage *)picImage andCompressBytesLow:(int)compressBytesLow{
    NSData *data = UIImageJPEGRepresentation(picImage,1.0);
    NSUInteger size = data.length / 1024;
    while(size > compressBytesLow){
        UIImage *image = [UIImage imageWithData:data];
        data = UIImageJPEGRepresentation(image, 0.9);;
        size = data.length/1024;
    }
    return data;
}
+(UIImage *)compressPicSizeWithOrignalImage:(UIImage *)orignalImage andCompressSize:(CGSize)compressSize{
    UIGraphicsBeginImageContext(compressSize);
    [orignalImage drawInRect:CGRectMake(0, 0, compressSize.width, compressSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(id)analysis:(NSString*)str{
    if (!str) {
        return str;
    }
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    
    id result = [NSJSONSerialization JSONObjectWithData:jsonData
                                                options:NSJSONReadingMutableContainers
                                                  error:&err];
    NSLog(@"result == ======%@",result);
    return result;
    
}
/*
 判断字符串是否
 */
+(BOOL)IsJudgeExistStr:(NSString*)str JudgeStr:(NSString*)judgeStr{
    
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)) {
        
        if ([str containsString:judgeStr])
            
            return YES;
        else
            return NO;
  
    }
    else
    {
        NSRange range = [str rangeOfString:judgeStr];//判断字符串是否包含
        if (range.length >0)//包含
            return YES;
   
        else//不包含
            return NO;
    }
        return NO;
 
    
    }

+(NSString*)stringFromNumber:(NSString*)NumberStr NumberStyle:(NSInteger)Styleindex{
    
    if (Styleindex == 0) {
        
        
        NSString *responseString1 =  [NumberStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        NSString *responseString2 = [responseString1 stringByReplacingOccurrencesOfString:@"," withString:@""];
        NSString *responseString3 = [responseString2 stringByReplacingOccurrencesOfString:@"￥" withString:@""];
        return responseString3;
        
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle =Styleindex;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithFloat:[NumberStr floatValue]]];
    
    
    return newAmount;
    
    
    
}
+(NSString *)agebirthStr:(NSString*)birth{
    if (!birth.length) {
        return @"";
    }
    //计算年龄
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //生日
    NSDate *birthDay = [dateFormatter dateFromString:birth];
    //当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
    NSLog(@"currentDate %@ birthDay %@",currentDateStr,birth);
    NSTimeInterval time=[currentDate timeIntervalSinceDate:birthDay];
    
    
    int age = ((int)time)/(3600*24*365);
    
    
    NSLog(@"year %d",age);
    
    NSString * ss = [NSString stringWithFormat:@"%d",age+1];
    return ss;
    
}
//将 &lt 等类似的字符转化为HTML中的“<”等
+ (NSString *)htmlEntityDecode:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; // Do this last so that, e.g. @"&amp;lt;" goes to @"&lt;" not @"<"
//    string=[string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    string=[string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    string=[string stringByReplacingOccurrencesOfString:@"\t" withString:@""];

    return string;
}
#pragma mark - 将字符串转化成试图控制器
+ (UIViewController *)StringIntoViewController:(NSString *)classString
{
    UIViewController *vc = [NSClassFromString(classString) new];
    return vc;
}

#pragma mark - 验证银行卡号是否规范
+ (BOOL)validateBankCardWithNumber:(NSString *)cardNum
{
    NSString * CT = @"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *regextestCard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if ([regextestCard evaluateWithObject:cardNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - 判断身份证号码是否规范
+(BOOL)checkIdentityCardNo:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

#pragma mark - 拨打电话
+ (void)makePhoneCallWithTelNumber:(NSString *)tel
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",tel]]];
}

#pragma mark - 判断手机号码是否正确
+ (BOOL)isValidateMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     * 联通：130,131,132,155,156,185,186,145,176
     * 电信：133,1349,153,180,181,189
     */
    NSString *MOBILE = @"^1(3[0-9]|4[47]|5[0-35-9]|7[68]|8[0-9])\\d{8}$";
    
    /**
     * 中国移动
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     */
    NSString * CU = @"^1(3[0-2]|4[5]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     * 中国电信
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - 判断手机号码的运营商类型
+ (NSString *)judgePhoneNumTypeOfMobileNum:(NSString *)mobileNum
{
    NSString *phoneNumType = nil;
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     * 联通：130,131,132,155,156,185,186,145,176
     * 电信：133,1349,153,180,181,189
     */
    //NSString *MOBILE = @"^1(3[0-9]|4[47]|5[0-35-9]|7[68]|8[0-9])\\d{8}$";
    
    /**
     * 中国移动
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     */
    NSString * CU = @"^1(3[0-2]|4[5]|5[256]|7[6]|8[56])\\d{8}$";
    /**
     * 中国电信
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if ([regextestcm evaluateWithObject:mobileNum] == YES)
    {
        phoneNumType = @"中国移动";
    }
    else if ([regextestct evaluateWithObject:mobileNum] == YES)
    {
        phoneNumType = @"中国联通";
    }
    else if ([regextestcu evaluateWithObject:mobileNum] == YES)
    {
        phoneNumType = @"中国电信";
    }
    
    return phoneNumType;
}

#pragma mark - 直接打开网页
+ (void)openURLWithUrlString:(NSString *)url
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
}

#pragma mark - 获取当前时间
+ (NSString *)currentTime
{
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];//获取当前日期
    [formater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];//这里去掉 具体时间 保留日期
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:TIME_ZONE];
    [formater setTimeZone:timeZone];
    NSString * curTime = [formater stringFromDate:curDate];
    
    return curTime;
}

#pragma mark - 将时间转换成时间戳
/**
 *  时间戳：指格林威治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总秒数。
 */
+ (NSString *)timeStringIntoTimeStamp:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:TIME_ZONE];
    [dateFormatter setTimeZone:timeZone];
    
    NSDate *date = [dateFormatter dateFromString:time];
    
    NSString *timeSP = [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]];
    
    return timeSP;
}

#pragma mark - 将时间戳转换成时间
+ (NSString *)timeStampIntoTimeString:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    /* 设置时区 */
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:TIME_ZONE];
    [dateFormatter setTimeZone:timeZone];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[time intValue]];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    //dateString = [dateString substringToIndex:20];
    return  dateString;
}

#pragma mark - 通过时间字符串获取年、月、日
+ (NSArray *)getYearAndMonthAndDayFromTimeString:(NSString *)time
{
    NSString *year = [time substringToIndex:4];
    NSString *month = [[time substringFromIndex:5] substringToIndex:2];
    NSString *day = [[time substringFromIndex:8] substringToIndex:2];
    
    return @[year,month,day];
}
#pragma mark - 获取今天、明天、后天的日期
+ (NSArray *)timeForTheRecentDate
{
    NSMutableArray *dateArr = [[NSMutableArray alloc]init];
    
    //今天
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    NSDate *curDate = [NSDate date];//获取当前日期
    [formater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];//这里去掉 具体时间 保留日期
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:TIME_ZONE];
    [formater setTimeZone:timeZone];
    NSString * curTime = [formater stringFromDate:curDate];
    
    NSArray *today = [MCToolsManage getYearAndMonthAndDayFromTimeString:curTime];
    [dateArr addObject:today];
    
    
    //明天
    NSString *timeStamp = [MCToolsManage timeStringIntoTimeStamp:curTime];
    NSInteger seconds = 24*60*60 + [timeStamp integerValue];
    timeStamp = [NSString stringWithFormat:@"%ld",(long)seconds];
    curTime = [MCToolsManage timeStampIntoTimeString:timeStamp];
    
    NSArray *tomorrow = [MCToolsManage getYearAndMonthAndDayFromTimeString:curTime];
    [dateArr addObject:tomorrow];
    
    
    return [NSArray arrayWithArray:dateArr];
}

#pragma mark - 当前界面截图
+ (UIImage *)imageFromCurrentView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, view.layer.contentsScale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 去掉html中的标签
+ (NSString *)stringRemovetheHTMLtags:(NSString *)htmlString
{
    NSScanner *scanner = [NSScanner scannerWithString:htmlString];
    
    NSString *text = nil;
    
    while (![scanner isAtEnd])
    {
        [scanner scanUpToString:@"<" intoString:NULL];
        [scanner scanUpToString:@">" intoString:&text];
        
        htmlString = [htmlString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
    scanner = [NSScanner scannerWithString:htmlString];
    while (![scanner isAtEnd])
    {
        [scanner scanUpToString:@"{" intoString:NULL];
        [scanner scanUpToString:@"}" intoString:&text];
        
        htmlString = [htmlString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@}",text] withString:@""];
    }
    
    return htmlString;
}

#pragma mark - 获取Documents中文件的路径
+ (NSString *)accessToTheDocumentsInTheFilePath:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    
    return filePath;
}

#pragma mark - 生成随机数 n到m
+(int)getRandomNumber:(int)from to:(int)to
{
    
    return (int)(from + (arc4random() % (to-from + 1)));
}

#pragma mark - 判断网址是否有效
+ (BOOL)validateHttp:(NSString *)textString
{
    NSString* number=@"^([w-]+.)+[w-]+(/[w-./?%&=]*)?$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
}

#pragma mark - 给view设置边框
+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}

#pragma mark - 将数组中重复的对象去除，只保留一个
+ (NSMutableArray *)arrayWithMemberIsOnly:(NSMutableArray *)array
{
    NSMutableArray *categoryArray =  [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [array count]; i++) {
        @autoreleasepool {
            if ([categoryArray containsObject:[array objectAtIndex:i]] == NO) {
                [categoryArray addObject:[array objectAtIndex:i]];
            }
        }
    }
    return categoryArray;
}

#pragma mark - 图片大小设置
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 44 * w, colorSpace,kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, size.width/3, size.height/3);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), scaledImage.CGImage);
    //CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    //返回新的改变大小后的图片
    return scaledImage;
}
static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

#pragma mark - 获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

#pragma mark - 获取当前处于activity状态的view controller
+ (UIViewController *)activityViewController
{
    UIViewController* activityViewController = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows)
        {
            if(tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0)
    {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        
        if([nextResponder isKindOfClass:[UIViewController class]])
        {
            activityViewController = nextResponder;
        }
        else
        {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
}

#pragma mark - 清空字典数据
+(NSMutableDictionary *)clearNullData:(NSDictionary *)dic
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    NSArray *data = dic.allKeys;
    for (int i=0; i<data.count; i++) {
        
        NSString *str = dic[data[i]];
        
        if ((NSNull *)str == [NSNull null]){
            [result setObject:@"" forKey:data[i]];
        }else{
            [result setObject:dic[data[i]] forKey:data[i]];
        }
    }
    
    return result;
}

#pragma mark - 将image 转化成nsdata
+(NSData *)getImageDataWith:(UIImage *)image
{
    NSData *data =UIImagePNGRepresentation(image);
    if (data==nil)
    {
        data =UIImageJPEGRepresentation(image, 0.1);
    }
    return data;
}

#pragma mark - 格式化千分位
+ (NSString *)positiveFormat:(NSString *)text
{
    if(!text || [text floatValue] == 0)
    {
        return @"0.00";
    }
    else if ([text floatValue]<1)
    {
        return [NSString stringWithFormat:@"%@",text];
    }
    else
    {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setPositiveFormat:@",###.00"];
        return [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    }
    return @"";
}

#pragma mark - 不四舍五入  小数
+(NSString *)notRounding:(float)price afterPoint:(int)position
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return [NSString stringWithFormat:@"%0.2f元",[roundedOunces floatValue]];
}

#pragma mark - 获取用户手机信息
+ (NSMutableDictionary *)getUserPhoneInfo
{
    NSMutableDictionary *phoneInfoDict = [NSMutableDictionary new];
    
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    //手机序列号（设备号）
    NSString* identifierNumber = [[UIDevice currentDevice].identifierForVendor UUIDString];
    
    //手机品牌型号
    [phoneInfoDict setObject:[self getUserPhoneModelNumber] forKey:@"mobiletype"];
    
    //添加手机系统版本
    [phoneInfoDict setObject:phoneVersion forKey:@"sysversion"];
    
    //登录来源 PC IOS Android WeChat
    [phoneInfoDict setObject:@"IOS" forKey:@"logintype"];
    
    //添加应用app版本号
    [phoneInfoDict setObject:appCurVersion forKey:@"appversion"];
    
    //添加手机序列号（设备号）
    [phoneInfoDict setObject:identifierNumber forKey:@"devicenumber"];
    return phoneInfoDict;
}

#pragma mark - 获取手机品牌型号
+ (NSString *)getUserPhoneModelNumber
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    return deviceString;
}

#pragma mark - 转化成手机号空格式字符串
+ (NSString *)becomePhoneNumTypeWithNSString:(NSString *)string
{
    
    NSString *newString = [[NSString alloc]init];
    
    NSString *first = [string substringToIndex:3];
    
    NSString *second = [string substringWithRange:NSMakeRange(3, 4)];
    NSString *third = [string substringFromIndex:7];
    
    newString = [NSString stringWithFormat:@"%@ %@ %@",first,second,third];
    
    return newString;
}

#pragma mark - 判断手机型号是否是5s以上
+ (BOOL)judgePhoneTypeIsCanFingerprint
{
    
    //获取手机品牌型号
    NSRange range = {6,1};
    
    NSString *phoneModelNum = @"0";
    if ([MCToolsManage getUserPhoneModelNumber].length >= 7)
    {
        phoneModelNum = [[MCToolsManage getUserPhoneModelNumber] substringWithRange:range];
    }
    
    if ([phoneModelNum integerValue] > 5)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - 拼接成中间有空格的字符串(类似银行卡中间空格)
+ (NSString *)jointBlankWithString:(NSString *)str
{
    NSString *getString = @"";
    
    int a = (int)str.length/4;
    int b = (int)str.length%4;
    int c = a;
    if (b>0)
    {
        c = a+1;
    }
    else
    {
        c = a;
    }
    for (int i = 0 ; i<c; i++)
    {
        NSString *string = @"";
        
        if (i == (c-1))
        {
            if (b>0)
            {
                string = [str substringWithRange:NSMakeRange(4*(c-1), b)];
            }
            else
            {
                string = [str substringWithRange:NSMakeRange(4*i, 4)];
            }
            
        }
        else
        {
            string = [str substringWithRange:NSMakeRange(4*i, 4)];
        }
        getString = [NSString stringWithFormat:@"%@ %@",getString,string];
    }
    return getString;
}
+(NSString*)app_Name{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
    
}



@end

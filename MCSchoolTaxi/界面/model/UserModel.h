//
//  UserModel.h
//  ZYStudent
//
//  Created by MC on 2016/12/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject


@property(nonatomic,copy)NSString * qqName;

@property(nonatomic,copy)NSString * id;
@property(nonatomic,copy)NSString * weixinAccount;//微信账号
@property(nonatomic,copy)NSString * phone;
@property(nonatomic,copy)NSString * sex;
@property(nonatomic,assign)NSInteger  type;//1手机  2QQ 3微信
@property(nonatomic,copy)NSString * avatar;//头像
@property(nonatomic,copy)NSString * userName;
@property(nonatomic,copy)NSString * favStar;//星星
@property(nonatomic,copy)NSString * weixinAvatar;//微信头像
@property(nonatomic,copy)NSString * qqAvatar;
@property(nonatomic,copy)NSString * sessionId;
@property(nonatomic,copy)NSString * qqAccount;
@property(nonatomic,assign)NSInteger  status;//1正常 2锁定
@property(nonatomic,copy)NSString * weixinName;

@end

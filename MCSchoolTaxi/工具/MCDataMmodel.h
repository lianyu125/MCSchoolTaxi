//
//  MCDataMmodel.h
//  ZYStudent
//
//  Created by MC on 2016/12/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface MCDataMmodel : NSObject

+ (MCDataMmodel *)sharedInstance;

@property(nonatomic,assign)CGRect showImgRect;

@property(nonatomic,copy)NSString*ReachabilityStatus;//网络状态

@property(nonatomic,strong)UserModel * userMdoel;

@end

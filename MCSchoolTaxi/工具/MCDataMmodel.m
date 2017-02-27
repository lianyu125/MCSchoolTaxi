//
//  MCDataMmodel.m
//  ZYStudent
//
//  Created by MC on 2016/12/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCDataMmodel.h"

@implementation MCDataMmodel


+ (MCDataMmodel *)sharedInstance
{
    static dispatch_once_t  onceToken;
    static MCDataMmodel * sSharedInstance;
    dispatch_once(&onceToken, ^{

        
        sSharedInstance = [[MCDataMmodel alloc]init];
        
        
    });
    return sSharedInstance;
}




@end

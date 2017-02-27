//
//  MCMApManager.h
//  MCCWYJ
//
//  Created by MC on 16/4/29.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMapLocationKit/AMapLocationKit.h>

//@protocol MCMApManagerDelegate <NSObject>
//
//
//@end


@interface MCMApManager : NSObject


+ (MCMApManager *)sharedInstance;
@property (nonatomic, strong) AMapLocationManager *locationManager;
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;

- (void)updateLocation;





-(void)Isdingwei:(BOOL)isdingwei CtlView:(BaseViewController*)ctlView;
@property(nonatomic,assign) BOOL isdingwei;
//@property(weak,nonatomic)id<MCMApManagerDelegate>delegate;
//度
@property(nonatomic,assign) CGFloat   lo;
//度
@property(nonatomic,assign) CGFloat   la;
//城市
@property(nonatomic,copy)  NSString *city;
@end

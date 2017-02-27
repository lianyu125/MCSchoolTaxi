//
//  MCMApManager.m
//  MCCWYJ
//
//  Created by MC on 16/4/29.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCMApManager.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

#define DefaultLocationTimeout 10
#define DefaultReGeocodeTimeout 5



@interface MCMApManager ()<AMapLocationManagerDelegate>
{
    BaseViewController *_ctlView;
    
}

@end

@implementation MCMApManager


+ (MCMApManager *)sharedInstance
{
    static dispatch_once_t  onceToken;
    static MCMApManager * sSharedInstance;
    
    

    
    
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[MCMApManager alloc] init];


        
       sSharedInstance.locationManager = [[AMapLocationManager alloc] init];
        
        
        
    });
    return sSharedInstance;
}
- (void)updateLocation
{
    

    [self.locationManager setDelegate:self];
    
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置允许在后台定位
            [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
    //        [sSharedInstance reGeocodeAction];
    
    [self initCompleteBlock];
    [self reGeocodeAction];
    [self locAction];

}
- (void)reGeocodeAction
{
    //进行单次带逆地理定位请求
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
}

- (void)locAction
{
    //进行单次定位请求
    [self.locationManager requestLocationWithReGeocode:NO completionBlock:self.completionBlock];
}

- (void)initCompleteBlock
{
    __weak MCMApManager *weakSelf = self;
    
    
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            //如果为定位失败的error，则不进行后续操作
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        //得到定位信息
        if (location)
        {
            if (regeocode)
            {
                
                NSLog(@">>>>>>%@",[NSString stringWithFormat:@"%@ \n %@-%@-%.2fm", regeocode.formattedAddress,regeocode.citycode, regeocode.adcode, location.horizontalAccuracy]);
                 NSString *responseString1 =  [regeocode.city stringByReplacingOccurrencesOfString:@"市" withString:@""];
                weakSelf.city =responseString1;// 、、regeocode.citycode;
                
            }
            else
            {
                
                
                NSLog(@"=====%@",[NSString stringWithFormat:@"lat:%f;lon:%f \n accuracy:%.2fm", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy]);
                
                weakSelf.la =location.coordinate.latitude;
                weakSelf.lo =location.coordinate.longitude;
                
            }
        }
    };
}

@end

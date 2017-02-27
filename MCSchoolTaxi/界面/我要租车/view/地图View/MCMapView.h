//
//  MCMapView.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/23.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCMapView : UIView


@property(nonatomic,weak)BaseViewController *ViewController;

@property(nonatomic,assign)CGRect ViewFrame;


@property (nonatomic, strong) AMapLocationManager *locationManager;
@property (nonatomic, strong) MAMapView *mapView;


@end

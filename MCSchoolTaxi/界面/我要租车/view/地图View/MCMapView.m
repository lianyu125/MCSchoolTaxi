//
//  MCMapView.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/23.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCMapView.h"
#define DefaultLocationTimeout  6
#define DefaultReGeocodeTimeout 3

@interface MCMapView ()<AMapLocationManagerDelegate,MAMapViewDelegate>
{
    
    
    
    
}
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;

@end



@implementation MCMapView



-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    
    if (self) {
        _ViewFrame = frame;
        [[MCMApManager sharedInstance]updateLocation];

        [self initMapView];
        [self initCompleteBlock];
        [self configLocationManager];
        
        //进行单次定位请求
        [self.locationManager requestLocationWithReGeocode:NO completionBlock:self.completionBlock];
        

        
    }
    
    return self;
}
- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    
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
}

- (void)initCompleteBlock
{
    __weak MCMapView *weakSelf = self;
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            //如果为定位失败的error，则不进行annotation的添加
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        //得到定位信息，添加annotation
        if (location)
        {
            MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
            [annotation setCoordinate:location.coordinate];
            
            if (regeocode)
            {
                [annotation setTitle:[NSString stringWithFormat:@"%@", regeocode.formattedAddress]];
                [annotation setSubtitle:[NSString stringWithFormat:@"%@-%@-%.2fm", regeocode.citycode, regeocode.adcode, location.horizontalAccuracy]];
            }
            else
            {
                [annotation setTitle:[NSString stringWithFormat:@"lat:%f;lon:%f;", location.coordinate.latitude, location.coordinate.longitude]];
                [annotation setSubtitle:[NSString stringWithFormat:@"accuracy:%.2fm", location.horizontalAccuracy]];
            }
            
            MCMapView *strongSelf = weakSelf;
            [strongSelf addAnnotationToMapView:annotation];
        }
    };
}

- (void)addAnnotationToMapView:(id<MAAnnotation>)annotation
{
    //    [self.mapView addAnnotation:annotation];
    
    //    [self.mapView selectAnnotation:annotation animated:YES];
    [self.mapView setZoomLevel:17.1 animated:NO];
    [self.mapView setCenterCoordinate:annotation.coordinate animated:YES];
}

#pragma mark - MAMapView Delegate

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        
        MAPinAnnotationView *annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
        annotationView.canShowCallout   = YES;
        annotationView.animatesDrop     = YES;
        annotationView.draggable        = NO;
        annotationView.pinColor         = MAPinAnnotationColorPurple;
        
        return annotationView;
    }
    
    return nil;
}

- (void)initMapView
{
    if (self.mapView == nil)
    {
        self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, _ViewFrame.size.width, _ViewFrame.size.height)];
        self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.mapView.zoomLevel = 17;
        self.mapView.showsCompass = NO;
        self.mapView.showsScale = NO;
        ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = MAUserTrackingModeFollow;
        [self.mapView setDelegate:self];
        
        [self addSubview:self.mapView];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

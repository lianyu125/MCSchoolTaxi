//
//  MCSeleAlertView.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MCSeleAlertViewDelegate <NSObject>
@required

-(void)MCSeleAlertViewHidden;

@optional

-(void)MCSeleAlertView:(NSInteger)selectIndex;

-(void)MCSeleAlertView:(NSInteger)selectDateIndex Index:(NSInteger)index;



@end




@interface MCSeleAlertView : UIView
@property(nonatomic,weak)id<MCSeleAlertViewDelegate>deldagate;

- (void)showInWindow;
-(instancetype)initWithFrame:(CGRect)frame MCstyle:(NSInteger)index;


-(instancetype)initWithFrame:(CGRect)frame  MCDateTyle:(NSInteger)dateindex MCstyle:(NSInteger)index;

- (void)showAnimateInWindow;






@end

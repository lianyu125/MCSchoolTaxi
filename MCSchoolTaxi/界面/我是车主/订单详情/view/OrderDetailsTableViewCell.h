//
//  OrderDetailsTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/27.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailsTableViewCell : UITableViewCell
@property(nonatomic,assign)NSInteger stateIndex;//1 待抢单   2接单中  3进行中 4待付款
@property(nonatomic,assign)NSInteger typeIndex;//1 预约  2即时

@property(nonatomic,strong)UIButton * btn;


@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UILabel * titleSubLbl;

@property(nonatomic,strong)UILabel * titleLbl2;
@property(nonatomic,strong)UILabel * titleSubLbl2;

-(void)prepareUI1;
-(void)prepareUI2;
-(void)prepareUI3;


@end

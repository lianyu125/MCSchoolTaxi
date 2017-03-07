//
//  OrderViewTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewTableViewCell : UITableViewCell

@property(nonatomic,assign)NSInteger  OrderIndex;//0 预约  1 即时  2已抢
-(void)prepareUI;
@property(nonatomic,strong)UIButton * btn;



-(void)prepareUI2;



@end

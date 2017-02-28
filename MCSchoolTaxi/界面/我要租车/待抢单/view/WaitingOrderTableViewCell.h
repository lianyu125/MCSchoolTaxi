//
//  WaitingOrderTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitingOrderTableViewCell : UITableViewCell

@property(nonatomic,strong)UIButton * btn1;
@property(nonatomic,strong)UIButton * btn2;

@property(nonatomic,strong)UITextField * titleLbl;
@property(nonatomic,strong)UITextField * titleSubLbl;
-(void)prepareUI;

@end

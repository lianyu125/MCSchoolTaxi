//
//  WaitingOrderTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitingOrderTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UILabel * titleSubLbl;
-(void)prepareUI;

@end

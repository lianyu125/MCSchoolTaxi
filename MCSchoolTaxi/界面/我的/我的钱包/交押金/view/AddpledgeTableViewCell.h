//
//  AddpledgeTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddpledgeTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UILabel * zhifenLbl;

-(void)preareUI;



@property(nonatomic,strong)UIImageView * imgView;
@property(nonatomic,strong)UIButton * seleBtn;

-(void)prepareUI2;

@end

//
//  RealNameTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/5.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RealNameTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView * iconImgview;

@property(nonatomic,strong)UITextField * TextField;

-(void)prepareUI;

@property(nonatomic,strong)UIButton * sexFBtn;
@property(nonatomic,strong)UIButton * sexMBtn;
-(void)prepareUI2;


@property(nonatomic,strong)UIButton * carIdBtn;
@property(nonatomic,strong)UILabel* titelLbl;
-(void)prepareUI3;


@end

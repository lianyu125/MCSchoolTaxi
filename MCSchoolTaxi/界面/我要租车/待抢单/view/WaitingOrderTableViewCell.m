//
//  WaitingOrderTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "WaitingOrderTableViewCell.h"

@implementation WaitingOrderTableViewCell

-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x =10;
    CGFloat w = 6;
    CGFloat h = w;
    CGFloat y = (44 - h)/2;
    UIView * hongview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    hongview.backgroundColor =[UIColor greenColor];
    ViewRadius(hongview, h/2);
    [self.contentView addSubview:hongview];
    y = 44 +1 +(44 - h)/2;
    hongview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    hongview.backgroundColor =[UIColor orangeColor];
    ViewRadius(hongview, h/2);
    [self.contentView addSubview:hongview];
    
    x = 10 + 6 + 10;
    y = 0;
    w = Main_Screen_Width - x;
    h = 44;
    
    _titleLbl  =[[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.userInteractionEnabled = NO;
    _titleLbl.textColor =[UIColor grayColor];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];
    
    _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_btn1];

    
    
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, 44, w, 1)];
    
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];

    y = 45;
    _titleSubLbl  =[[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleSubLbl.userInteractionEnabled = NO;

    _titleSubLbl.textColor =[UIColor grayColor];
    _titleSubLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleSubLbl];
    _btn2 = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_btn2];

    
    
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

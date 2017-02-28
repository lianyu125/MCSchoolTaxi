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
    
    _titleLbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.textColor =[UIColor grayColor];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, 44, w, 1)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];

    y = 45;
    _titleSubLbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleSubLbl.textColor =[UIColor grayColor];
    _titleSubLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleSubLbl];

    
    
    
    
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

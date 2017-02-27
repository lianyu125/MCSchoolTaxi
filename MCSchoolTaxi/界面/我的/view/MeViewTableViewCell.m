//
//  MeViewTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MeViewTableViewCell.h"

@implementation MeViewTableViewCell

-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat w = 20;

    CGFloat h = 20;
    CGFloat y = (44 - 20)/2;
    
    _imgView =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_imgView];
    x +=w + 8;
    w = 150;
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.textColor = [UIColor grayColor];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];

    x = Main_Screen_Width - 10 - 20 - 5 - 8;
    w = 8;
    h = w;
    y = (44-h)/2;
    _hongView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _hongView.backgroundColor =[UIColor redColor];
    ViewRadius(_hongView, h/2);
    [self.contentView addSubview:_hongView];

    
    
    
    
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

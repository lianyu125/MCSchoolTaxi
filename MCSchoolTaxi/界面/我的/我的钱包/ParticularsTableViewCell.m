//
//  ParticularsTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "ParticularsTableViewCell.h"

@implementation ParticularsTableViewCell

-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width/2;
    CGFloat h = 40;
    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"交押金";
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:lbl];
    y+=h - 5;
    h = 15;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"2017-09-09 10:10:11";
    lbl.textColor = [UIColor lightGrayColor];
    lbl.font =[UIFont systemFontOfSize:13];
    [self.contentView addSubview:lbl];
    
    
    x  = Main_Screen_Width /2;
    w = Main_Screen_Width -x - 10;
    h = 55;
    y = 0;
    
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"-￥120.00";
    lbl.textColor = [UIColor orangeColor];
    lbl.textAlignment = NSTextAlignmentRight;
    lbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:lbl];
    

    
    
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

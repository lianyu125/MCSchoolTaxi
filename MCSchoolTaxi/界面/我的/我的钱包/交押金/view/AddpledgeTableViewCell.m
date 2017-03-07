//
//  AddpledgeTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "AddpledgeTableViewCell.h"

@implementation AddpledgeTableViewCell
-(void)preareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = (44 - 20)/2;
    CGFloat w = 20;
    CGFloat h = 20;
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"icon_credit"];
    [self.contentView addSubview:imgview];
    x+=w + 10;
    w = Main_Screen_Width;
    y = 0;
    h = 44;
    _titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.text =@"芝麻信用(满660分可免押金)";
    _titleLbl.font =[UIFont systemFontOfSize:14];
    _titleLbl.textColor =[UIColor grayColor];
    [self.contentView addSubview:_titleLbl];

    
    x = Main_Screen_Width - 30 - 100;
    w = 100;
    _zhifenLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _zhifenLbl.text =@"550分";
    _zhifenLbl.font =[UIFont systemFontOfSize:14];
    _zhifenLbl.textColor =[UIColor grayColor];
    _zhifenLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_zhifenLbl];
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = (44 - 30)/2;
    CGFloat w = 30;
    CGFloat h = 30;
    _imgView =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_imgView];
 
    
    x +=w + 10;
    w = 100;
    y = 0;
    h = 44;
    _titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    _titleLbl.textColor =[UIColor grayColor];
    [self.contentView addSubview:_titleLbl];
    x = Main_Screen_Width - 10 - 44;
    y = 0;
    w = 44;
    h = 44;
    _seleBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_seleBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
    [_seleBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
    [self.contentView addSubview:_seleBtn];
    _seleBtn.userInteractionEnabled = NO;
    
    
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

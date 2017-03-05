//
//  RealNameTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/5.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "RealNameTableViewCell.h"

@implementation RealNameTableViewCell
-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat w = 20;
    CGFloat h = w;
    CGFloat y = (44 - h)/2;
    _iconImgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_iconImgview];
    x+=w + 10;
    w = Main_Screen_Width - x - 30;
    h = 44;
    y = 0;
    _TextField =[[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _TextField.textColor =[UIColor grayColor];
    _TextField.font =[ UIFont systemFontOfSize:15];
    [self.contentView addSubview:_TextField];

    
    
    
    
}
-(void)prepareUI2{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }

    CGFloat x = 10;
    CGFloat w = 64;
    CGFloat h = 44;
    CGFloat y = 0;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.text = @"我的性别";
    [self.contentView addSubview:lbl];
    x = Main_Screen_Width/2 - 30;
    w = 30;
    y = 0;
    h = 44;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.text = @"男";
    [self.contentView addSubview:lbl];
    w =44;
    h = 44;
    x -=w;
    _sexMBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_sexMBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
    [_sexMBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
    [self.contentView addSubview:_sexMBtn];
    
    
    x = Main_Screen_Width/2 + 30;
    _sexFBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_sexFBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
    [_sexFBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
    [self.contentView addSubview:_sexFBtn];
    x+=w;
    w = 30;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.text = @"女";
    [self.contentView addSubview:lbl];
    
    
}
-(void)prepareUI3{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor =[UIColor whiteColor];
    CGFloat x = 30;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = MCAdaptiveH(625, 253, w);
    CGFloat y = 0;
    
    UIView * idCardView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    //    idCardView.backgroundColor = [UIColor whiteColor];
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, idCardView.mj_w, idCardView.mj_h);
    borderLayer.position = CGPointMake(CGRectGetMidX(borderLayer.bounds), CGRectGetMidY(borderLayer.bounds));
    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@3, @3];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    [idCardView.layer addSublayer:borderLayer];
    [self.contentView addSubview:idCardView];

 
    CGFloat  lw = [MCToolsManage heightforString:@"添加身份证正面图" andHeight:20 fontSize:14];
 
    CGFloat lx = (idCardView.mj_w - lw)/2;
    CGFloat ly = (idCardView.mj_h - 20)/2;
    _titelLbl = [[UILabel alloc]initWithFrame:CGRectMake(lx, ly, lw, 20)];
    _titelLbl.text = @"添加身份证正面图";
    _titelLbl.font =[UIFont systemFontOfSize:14];
    _titelLbl.textColor = [UIColor grayColor];
    [idCardView addSubview:_titelLbl];
    UIImageView * addimgView =[[UIImageView alloc]initWithFrame:CGRectMake(lx - 5 - 20, ly, 20, 20)];
    addimgView.image =[UIImage imageNamed:@"card_add"];
    [idCardView addSubview:addimgView];
    _carIdBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, idCardView.mj_w, idCardView.mj_h)];
    [idCardView addSubview:_carIdBtn];

    
    
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

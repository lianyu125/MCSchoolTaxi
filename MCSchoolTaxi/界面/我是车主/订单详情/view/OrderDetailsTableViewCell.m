//
//  OrderDetailsTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/27.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "OrderDetailsTableViewCell.h"

@implementation OrderDetailsTableViewCell
-(void)prepareUI1{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    

    
   CGFloat x = 10;
   CGFloat y = 15;
   CGFloat w = 35;
   CGFloat h = w;
    UIButton * headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [headerBtn setBackgroundImage:[UIImage imageNamed:@"icon_head_small"] forState:0];
    [self.contentView addSubview:headerBtn];
    
    x +=w + 8;
    
    w =[MCToolsManage heightforString:@"michan" andHeight:h fontSize:14];
    UILabel * namelbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    namelbl.textColor =[UIColor darkTextColor];
    namelbl.font =[UIFont systemFontOfSize:14 ];
    [self.contentView addSubview:namelbl];
    
    x +=w + 8;
    y+= 7.5;
    h = 20;//h-2*5;
    w = MCAdaptiveW(144, 36, h);
    UIImageView * huiyuanImgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    huiyuanImgview.image =[UIImage imageNamed:@"label_vip_black"];
    [self.contentView addSubview:huiyuanImgview];
    
    
    
    
    y = headerBtn.mj_y + headerBtn.mj_h +15;
    h = 20;
    w = [MCToolsManage heightforString:@"预租24小时" andHeight:20 fontSize:14];
    x =18;
    
    UIView * hongView =[[UIView alloc]initWithFrame:CGRectMake(10, y+(20-4)/2, 4, 4)];
    hongView.backgroundColor =AppCOLOR;
    ViewRadius(hongView, 4/2);
    [self.contentView addSubview:hongView];
    
    
    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"预租24小时";
    [self.contentView addSubview:lbl];
    
    x+= w + 10 + 5;
    hongView =[[UIView alloc]initWithFrame:CGRectMake(x-8, y+(20-4)/2, 4, 4)];
    hongView.backgroundColor =AppCOLOR;
    ViewRadius(hongView, 4/2);
    [self.contentView addSubview:hongView];
    w = [MCToolsManage heightforString:@"租车类型:电动汽车" andHeight:20 fontSize:14];
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"租车类型:电动汽车";
    [self.contentView addSubview:lbl];
    
    y+= h+ 10;
    x = 18;
    w = Main_Screen_Width - x - 90;
    hongView =[[UIView alloc]initWithFrame:CGRectMake(x-8, y+(20-4)/2, 4, 4)];
    hongView.backgroundColor =AppCOLOR;
    ViewRadius(hongView, 4/2);
    [self.contentView addSubview:hongView];
    
    NSString * str = @"预约租车时间:2017-02-26 15:20";
    if (_typeIndex == 2) {
        str = @"预约租车费用:￥10.00";
    }
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =str;//@"租车类型:电动";
    [self.contentView addSubview:lbl];
    
    
    y= 0;
    h = 125;
    w = MCAdaptiveW(180, 258, h);
    x = Main_Screen_Width - w;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:view];
    
    if (_stateIndex == 1) {
        _btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
        _btn.backgroundColor = AppCOLOR;
        [_btn setTitle:@"抢单" forState:0];
        [_btn setTitleColor:[UIColor whiteColor] forState:0];
        _btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [view addSubview:_btn];

    }
    else
    {
        _btn =[[UIButton alloc]initWithFrame:CGRectMake((w - 44)/2, (h - 44)/2, 44, 44)];
        [_btn setImage:[UIImage imageNamed:@"card_tel"] forState:0];
        [view addSubview:_btn];
 
    }
    
    
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    
    
    CGFloat x = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width / 2;;
    CGFloat h = 44;
   _titleLbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.textColor =[UIColor grayColor];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];
    x = Main_Screen_Width/2;
    w = Main_Screen_Width/2 - 10;
    _titleSubLbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleSubLbl.textColor =[UIColor orangeColor];
    _titleSubLbl.textAlignment = NSTextAlignmentRight;
    _titleSubLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleSubLbl];

    
}
-(void)prepareUI3{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = 8;
    CGFloat w = [MCToolsManage heightforString:@"创建订单时间" andHeight:20 fontSize:14];
    
    CGFloat h = 20;
    
    _titleLbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.textColor =[UIColor grayColor];
    _titleLbl.text =@"创建订单时间";
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];

    x +=w + 10;
    w = Main_Screen_Width - x - 10;
    _titleSubLbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleSubLbl.textColor =[UIColor grayColor];
    _titleSubLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleSubLbl];

    
    
    x = 10;
    w = _titleLbl.mj_w;
    y += h + 5;
    h = 20;
    _titleLbl2  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl2.text =@"订单号";

    _titleLbl2.textColor =[UIColor grayColor];
    _titleLbl2.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl2];
    
    x = _titleSubLbl.mj_x;
    w = _titleSubLbl.mj_w;
    _titleSubLbl2  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleSubLbl2.textColor =[UIColor grayColor];
    _titleSubLbl2.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleSubLbl2];
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

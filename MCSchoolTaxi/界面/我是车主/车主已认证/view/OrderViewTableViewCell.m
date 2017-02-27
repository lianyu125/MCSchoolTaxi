//
//  OrderViewTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "OrderViewTableViewCell.h"

@implementation OrderViewTableViewCell
-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 0;
    CGFloat h =25;
    CGFloat y = (40 -h)/2;
    CGFloat w = [MCToolsManage heightforString:@"待抢单" andHeight:h fontSize:14]+20;
    UIImageView * lblview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lblview.image =[UIImage imageNamed:@"label_status-bar"];
    [self.contentView addSubview:lblview];
    NSString * lblstr = @"待抢单";
    if (_OrderIndex == 0) {
        
    }
    else if (_OrderIndex == 1){
        
    }
    else if (_OrderIndex == 2){
        
    }
    UILabel *_statusLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, lblview.mj_w, 25)];
    _statusLbl.text = lblstr;
    _statusLbl.font = [UIFont systemFontOfSize:14];
    _statusLbl.textColor =[UIColor whiteColor];
    _statusLbl.textAlignment = NSTextAlignmentCenter;
    [lblview addSubview:_statusLbl];

    NSString *timeStr = @"2017-02-26 12:56:23";
    x += w + 8;
    y = 0;
    h = 40;
    w= [MCToolsManage heightforString:timeStr andHeight:h fontSize:14];
    UILabel * timelbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timelbl.textColor = [UIColor grayColor];
    timelbl.font = [UIFont systemFontOfSize:14];
    timelbl.text = timeStr;
    [self.contentView addSubview:timelbl];
    x +=w + 8;
    w = 60;
    
    UILabel * tyeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    tyeLbl.textColor = [UIColor grayColor];
    tyeLbl.font = [UIFont systemFontOfSize:14];
    tyeLbl.text = @"预约";
    [self.contentView addSubview:tyeLbl];
    
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 39, Main_Screen_Width, 1)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];

    x = 10;
    y = 40 + 15;
    w = 35;
    h = w;
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
    if (_OrderIndex == 1) {
        str = @"预约租车费用:￥10.00";
    }
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =str;//@"租车类型:电动";
    [self.contentView addSubview:lbl];

    
    y+= h + 10;
    h = y - 40;
    w = MCAdaptiveW(180, 258, h);
    x = Main_Screen_Width - w;
    y = 40;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:view];
    if (_OrderIndex== 2) {
        
        _btn =[[UIButton alloc]initWithFrame:CGRectMake((w - 44)/2, (h - 44)/2, 44, 44)];
        [_btn setImage:[UIImage imageNamed:@"card_tel"] forState:0];
        [view addSubview:_btn];
  
        
        
    }
    else
    {
        _btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
        _btn.backgroundColor = AppCOLOR;
        [_btn setTitle:@"抢单" forState:0];
        [_btn setTitleColor:[UIColor whiteColor] forState:0];
        _btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [view addSubview:_btn];
        
    }
    
    
    
    
    
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

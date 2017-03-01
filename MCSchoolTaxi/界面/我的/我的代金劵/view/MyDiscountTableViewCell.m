//
//  MyDiscountTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/1.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MyDiscountTableViewCell.h"

@implementation MyDiscountTableViewCell

-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor =AppMCBgCOLOR;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat h = MCAdaptiveH(734, 264, Main_Screen_Width - 0);
    CGFloat w = Main_Screen_Width ;
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"card_coupon"];
    [self.contentView addSubview:imgview];
   
    y = h / 2 -10 -8 - 20;
    x = 20;
    w = imgview.mj_w - x * 2;
    h = 20;
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.textColor = [UIColor whiteColor];
    titleLbl.font =[UIFont systemFontOfSize:20];
    titleLbl.text = @"代金劵";
    [imgview addSubview:titleLbl];
    
    y +=h + 8;
    w = imgview.mj_w;
    x = 20;
    UILabel * timeLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor whiteColor];
    timeLbl.font =[UIFont systemFontOfSize:12];
    timeLbl.text = @"有效期:2017-09-08至2017-10-10";
    [imgview addSubview:timeLbl];
    
    w = imgview.mj_w/2-20;
    x = imgview.mj_w - w -10;
    h = 30;
    y = (imgview.mj_h -h)/2;
    UILabel * priceLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    priceLbl.textColor = [UIColor whiteColor];
    priceLbl.font =[UIFont systemFontOfSize:20];
    priceLbl.textAlignment = NSTextAlignmentRight;
    priceLbl.text = @"￥50.00";
    [imgview addSubview:priceLbl];
    
    
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

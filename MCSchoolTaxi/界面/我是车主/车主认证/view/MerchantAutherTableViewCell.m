
//
//  MerchantAutherTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/24.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MerchantAutherTableViewCell.h"

@implementation MerchantAutherTableViewCell
-(void)prepareUI{
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = AppMCBgCOLOR;
    CGFloat x = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44 * 5 + 0.5 * 4;
    UIView * bgView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewBorderRadius(bgView, 5, 0.5, [UIColor groupTableViewBackgroundColor]);
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];

    x = 10;
    w = [MCToolsManage heightforString:@"电动自行车数量" andHeight:44 fontSize:14];
    y = 0;
    h = 44;

    NSArray * titleArray = @[@"租车行名称",@"租车行地址",@"自行车数量",@"电动自行车数量",@"电动汽车数量"];
    
    NSArray * placeholderArray = @[@"请输入租车行名称",@"请输入租车行地址",@"请输入自行车数量",@"请输入电动自行车数量",@"请输入电动汽车数量"];

    for (NSInteger i = 0 ; i <titleArray.count; i++) {
        NSString * str =titleArray[i];
        UILabel * titleLbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        titleLbl.textColor = [UIColor grayColor];
        titleLbl.font = [UIFont systemFontOfSize:14];
        [bgView addSubview:titleLbl];
        titleLbl.text = str;
        UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y +h, bgView.mj_w - 2*x, 0.5)];
        lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [bgView addSubview:lineView];
        
        
        UITextField*  Field = [[UITextField alloc]initWithFrame:CGRectMake(x +w + 10, y, bgView.mj_w - (x +w + 10) - 10, 44)];
        Field.placeholder = placeholderArray[i];//@"请输入真实姓名";
        Field.font = [UIFont systemFontOfSize:14];
        Field.tag = i + 200;
        [bgView addSubview:Field];
        Field.textColor = [UIColor grayColor];
        Field.text = _textArray[i];
        if (i >1) {
            Field.keyboardType = UIKeyboardTypeNumberPad;
        }
        if (i ==1) {
            Field.userInteractionEnabled = NO;
            _seleAddBtn =[[UIButton alloc]initWithFrame:CGRectMake(x +w + 10, y, bgView.mj_w - (x +w + 10) - 10, 44)];
            
            [bgView addSubview:_seleAddBtn];
            
        }
        else
        {
            Field.userInteractionEnabled = YES;
            
        }

        Field.delegate = _viewController;
        
            if (i +1 <titleArray.count) {
            y+=h + 0.5;
            
            
        }
        
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

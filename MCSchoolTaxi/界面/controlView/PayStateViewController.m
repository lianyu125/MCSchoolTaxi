//
//  PayStateViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/1.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "PayStateViewController.h"

@interface PayStateViewController ()

@end

@implementation PayStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付成功";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat x = 10;
    CGFloat w= Main_Screen_Width - 2*x;
    CGFloat h = MCAdaptiveH(716, 894, w);
    CGFloat y = 64 + 50;
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"card_bg_nobtn"];
    [self.view addSubview:imgview];
    
    y =imgview.mj_h -40 - 10;
    x = 30;
    w = imgview.mj_w - 60;
    h = 35*MCHeightScale;
    
  UIButton*  btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"确定" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    btn.backgroundColor = AppCOLOR;
    [imgview addSubview:btn];
//    [btn addTarget:self action:@selector(actionPay) forControlEvents:1<<6];
    
    w = 90;
    h = 90;
    x = (imgview.mj_w -w )/2;
    y =( imgview.mj_h - h)/2 - 20 - 50;
    UIImageView * stateImgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    stateImgview.image =[UIImage imageNamed:@"icon_success"];
    [imgview addSubview:stateImgview];
    y +=h + 30;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(0, y, imgview.mj_w, 20)];
    lbl.text = @"支付成功";
    lbl.textColor = AppCOLOR;
    lbl.font =[UIFont systemFontOfSize:18];
    lbl.textAlignment = NSTextAlignmentCenter;
    [imgview addSubview:lbl];

    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

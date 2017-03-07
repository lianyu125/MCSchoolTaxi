//
//  withdraw2ViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "withdraw2ViewController.h"
#import "PayStateViewController.h"
@interface withdraw2ViewController ()
{
    
    UILabel * moneyLbl;

}

@end

@implementation withdraw2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat x = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat y = 64;
    CGFloat h = MCAdaptiveH(750, 354, w);
    UIImageView * bgimgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgimgview.image =[UIImage imageNamed:@"bg_cash-pledge"];
    [self.view addSubview:bgimgview];
    
    
    y =(bgimgview.mj_h - 40)/2;
    NSString * ss = @"297.50";
    w = [MCToolsManage heightforString:ss andHeight:40 fontSize:40];
    x = (Main_Screen_Width - w)/2;
    h = 40;
    moneyLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    moneyLbl.textColor= [UIColor whiteColor];
    moneyLbl.font =[UIFont fontWithName:@"Arial-BoldMT" size:40];//[UIFont systemFontOfSize:25];
    
    moneyLbl.textAlignment  = NSTextAlignmentCenter;
    moneyLbl.text =@"297.50";
    [bgimgview addSubview:moneyLbl];

    w= 15;
    x -=w;
    h = 20;
    UILabel*lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"￥";
    lbl.textColor =[UIColor whiteColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [bgimgview addSubview:lbl];
    
    y += 40 + 20;
    h = 20;
    w = Main_Screen_Width;
    x = 0;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"提现金额";
    lbl.textColor =[UIColor whiteColor];
    lbl.font =[UIFont systemFontOfSize:15];
    [bgimgview addSubview:lbl];
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, bgimgview.mj_h + 64, Main_Screen_Width, 44)];
    view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:view];
    
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 44)];
    lbl.text= @"提现金额";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];

    lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, 44)];
    lbl.text= @"michan";
    lbl.textColor =[UIColor grayColor];
    lbl.textAlignment = NSTextAlignmentRight;
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 43.5, Main_Screen_Width, 0.5)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [view addSubview:lineView];

    
    y = view.mj_y + 44 + 64;
    w = Main_Screen_Width - 60;
    x = 30;
    h = 40;
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"确定提现" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    btn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    ViewRadius(btn, 5);
  [btn addTarget:self action:@selector(actionOKBtn) forControlEvents:1<<6];
    [self.view addSubview:btn];

    
}
-(void)actionOKBtn{
    PayStateViewController * ctl =[[PayStateViewController alloc]init];
    ctl.Payindex = 4;
    [self pushNewViewController:ctl];
    
    
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

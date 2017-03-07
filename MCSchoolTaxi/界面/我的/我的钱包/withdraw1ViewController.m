//
//  withdraw1ViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "withdraw1ViewController.h"
#import "withdraw2ViewController.h"

@interface withdraw1ViewController ()<UITextFieldDelegate>
{
    
    UITextField * numText;

    UITextField * numText1;
    
    UILabel * moneyLbl;

    
}

@end

@implementation withdraw1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat x = 10;
    CGFloat w = Main_Screen_Width - 20;
    CGFloat y = 64 + 20;
    CGFloat h = 44;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:view];
    
    ViewRadius(view, 3);
    
    
    x = 10;
    w = 100;
    y = 0;
    h = 44;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"提现金额";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    x = view.mj_w - 10 - 20;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"元";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    x = view.mj_w - 10 - 20 - 5 - 150;
    w = 150;
    y = 0;
    h = 44;
    numText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    numText.font =[UIFont systemFontOfSize:14];
    numText.textColor =[UIColor grayColor];
    numText.textAlignment = NSTextAlignmentRight;
    numText.delegate = self;
    numText.placeholder = @"0.00（不低于10元）";
    [view addSubview:numText];


    x = 10;
    w = Main_Screen_Width - 20;
     y = 64 + 20 + 44 + 20;
    h = 44;
    view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:view];
    
    ViewRadius(view, 3);
    
    x = 10;
    w = 25;
    h = w;
    y = (44- w)/2;
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"icon_alipay"];
    
    [view addSubview:imgview];

    x+=w+5;
    w = [MCToolsManage heightforString:@"支付宝账号" andHeight:44 fontSize:14];
    y =0;
    h = 44;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"支付宝账号";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    x +=w + 10;
    w = view.mj_w - x - 10;
    h = 44;
    y = 0;
    numText1 = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    numText1.font =[UIFont systemFontOfSize:14];
    numText1.textColor =[UIColor grayColor];
    numText1.textAlignment = NSTextAlignmentRight;
    numText1.delegate = self;
    numText1.placeholder = @"请输入支付宝账号";
    [view addSubview:numText1];

    y =view.mj_y + view.mj_h + 60;
    NSString * ss = @"297.50";
    w = [MCToolsManage heightforString:ss andHeight:40 fontSize:40];
    x = (Main_Screen_Width - w)/2;
    h = 40;
    moneyLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    moneyLbl.textColor= [UIColor blackColor];
    moneyLbl.font =[UIFont fontWithName:@"Arial-BoldMT" size:40];//[UIFont systemFontOfSize:25];
    
    moneyLbl.textAlignment  = NSTextAlignmentCenter;
    moneyLbl.text =@"297.50";
    [self.view addSubview:moneyLbl];
    w= 15;
    x -=w;
    h = 20;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"￥";
    lbl.textColor =[UIColor blackColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:lbl];

    y+= h + 40 + 50;
    x = 30;
    w = Main_Screen_Width - 60;
    h = 40;
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"下一步" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    btn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    ViewRadius(btn, 5);
   [btn addTarget:self action:@selector(actionnextBtn) forControlEvents:1<<6];
    [self.view addSubview:btn];
    

}
-(void)actionnextBtn{
    
    withdraw2ViewController * ctl =[[withdraw2ViewController alloc]init];
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

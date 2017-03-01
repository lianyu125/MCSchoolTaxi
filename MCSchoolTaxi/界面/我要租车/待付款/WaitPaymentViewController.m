//
//  WaitPaymentViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "WaitPaymentViewController.h"
#import "PayStateViewController.h"
#import "MyDiscountViewController.h"

@interface WaitPaymentViewController ()
{
    
    UILabel * yingFLbl;
    UILabel * shiFLbl;

    UILabel * jinLbl;
    UILabel * yuLbl;

    
}

@end

@implementation WaitPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"待付款";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat x = 10;
    CGFloat w = 20;
    CGFloat h = 20;
    CGFloat y = (64 - h)/2;
    UIView *bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, 64)];
    bgview.backgroundColor = RGBCOLOR(241, 249, 255);
    [self.view addSubview:bgview];
    UIImageView * imgview=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"icon_tips"];
    [bgview addSubview:imgview];
    
    x +=w + 10;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, 0, Main_Screen_Width -x - 10, 64)];
    lbl.textColor = AppCOLOR;
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.numberOfLines = 0;
    lbl.text = @"车主已经确认了您的还车请求，请及时支付租车费用";
    [bgview addSubview:lbl];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 63, Main_Screen_Width, 1)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];
    
    
    x = 10;
    y = 64 + 10+64;
    w = Main_Screen_Width - x*2;
    h = 64;
    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    
    
    x = 8;
    y = 0;
    w = 10;
    h = 15;
    imgview=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"icon_driver-flag"];
    [bgview addSubview:imgview];
    
    w = 44;
    h = w;
    x =40;
    y = (64-h)/2;
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setImage:[UIImage imageNamed:@"card_head_driver"] forState:0];
    ViewRadius(btn, h/2);
    [bgview addSubview:btn];
    
    x +=w + 10;
    w = [MCToolsManage heightforString:@"michan" andHeight:44 fontSize:14];
    h = 44;
    UILabel * namelbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    
    namelbl.textColor = [UIColor darkTextColor];
    namelbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:namelbl];
    x+=w + 5;
    w = [MCToolsManage heightforString:@"4339单" andHeight:18 fontSize:11]+15;
    y = (64-18)/2;
    h = 18;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = AppCOLOR;
    lbl.font =[UIFont systemFontOfSize:11];
    lbl.text = @"4339单";
    lbl.textAlignment = NSTextAlignmentCenter;
    ViewBorderRadius(lbl, h/2, 1, self.appColor);
    [bgview addSubview:lbl];
    
    w = 30;
    h = w;
    y = (64-h)/2;
    x = bgview.mj_w - w - 10;
    
    UIButton *callBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [callBtn setImage:[UIImage imageNamed:@"card_tel"] forState:0];
    [bgview addSubview:callBtn];
    

    x = 10;
    y  = bgview.mj_h + bgview.mj_y + 10;
    w = bgview.mj_w;
    h = 44 * 3 + 2;
    
    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    
    
    x = 10;
    y = 0;
    w = 100;
    h = 44;
     lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"应付费用";
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];
    
    w = bgview.mj_w /2;
    x = bgview.mj_w - 10 - w;
    
    h = 44;
    y = 0;
    yingFLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    yingFLbl.text = @"￥22.00";
    yingFLbl.textAlignment = NSTextAlignmentRight;
    yingFLbl.textColor = [UIColor grayColor];
    yingFLbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:yingFLbl];
    
    y = 44;
    x = 10;
    w =bgview.mj_w - 20;
    h = 1;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];

    y+=h;
    w = 100;
    h = 44;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"实际支付";
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];
    
    w = bgview.mj_w /2;
    x = bgview.mj_w - 10 - w;
    
    h = 44;

    shiFLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    shiFLbl.text = @"￥22.00";
    shiFLbl.textAlignment = NSTextAlignmentRight;
    shiFLbl.textColor = [UIColor grayColor];
    shiFLbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:shiFLbl];

    y= 44*2 + 1;
    x = 10;
    w =bgview.mj_w - 20;
    h = 1;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];
    
    x = 10;
    y+=h +12;
    w = 20;
    h =20;
    
    imgview=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"me_icon_coupon"];
    [bgview addSubview:imgview];
    x +=w +5;
    w = 100;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"代金卷";
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];


    w = 20;
    x = bgview.mj_w- w;
    h = 20;
    imgview=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"btn_arrow_next"];
    [bgview addSubview:imgview];
    
    
    
    w = bgview.mj_w / 2;
    x -=w;
   jinLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    jinLbl.text = @"￥22.00";
    jinLbl.textAlignment = NSTextAlignmentRight;
    jinLbl.textColor = [UIColor grayColor];
    jinLbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:jinLbl];

    UIButton * jinbtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [jinbtn addTarget:self action:@selector(actionJinBtn) forControlEvents:1<<6];
    [bgview addSubview:jinbtn];
    
    
    y = bgview.mj_y + bgview.mj_h + 10;
    h = 44;
    w = bgview.mj_w;
    x = 10;
    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    
    x = 10;
    w = 100;
    h = 44;
    y = 0;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"您的余额";
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];
 
    w = bgview.mj_w / 2;
    x = bgview.mj_w - 10 - w;
    jinLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    jinLbl.text = @"￥22.00";
    jinLbl.textAlignment = NSTextAlignmentRight;
    jinLbl.textColor = [UIColor grayColor];
    jinLbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:jinLbl];

    
    y =bgview.mj_h  + bgview.mj_y + 40;
    x = 30;
    w = Main_Screen_Width - 60;
    h = 40;
    
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"支付" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    btn.backgroundColor = AppCOLOR;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(actionPay) forControlEvents:1<<6];
    
    
    
}
-(void)actionPay{
    PayStateViewController * ctl =[[PayStateViewController alloc]init];
    [self pushNewViewController:ctl];
    
}
-(void)actionJinBtn{
    MyDiscountViewController * ctl =[[MyDiscountViewController alloc]init];
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

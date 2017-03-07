//
//  MyWalletViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MyWalletViewController.h"
#import "AddpledgeViewController.h"
#import "RechargeViewController.h"
#import "PayStateViewController.h"
#import "withdraw1ViewController.h"
#import "ParticularsViewController.h"

@interface MyWalletViewController ()
{
    
    UILabel * _balanceLbl;
    
    UIButton *_rechargeBtn;//充值
    UIButton * _withdrawBtn;//提现
    
    UILabel *_pledgeLbl;//押金
    UIButton *_pledgeBtn;//交押金

    
    
    
}

@end

@implementation MyWalletViewController
-(void)actionMingXiBtn{
    ParticularsViewController * ctl =[[ParticularsViewController alloc]init];
    [self pushNewViewController:ctl];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的钱包";
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"明细" style:UIBarButtonItemStylePlain target:self action:@selector(actionMingXiBtn)];
    [self prepareUI];
    // Do any additional setup after loading the view.
}

-(void)prepareUI{
    
    CGFloat x = 0;
    CGFloat y = 64;
    CGFloat w = Main_Screen_Width;
    CGFloat h = MCAdaptiveH(750, 814, w);
    
    UIImageView * bgimgview=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgimgview.image =[UIImage imageNamed:@"bg_balance"];
    [self.view addSubview:bgimgview];
    
    
    x = 0;
    h = 50;
    y = (bgimgview.mj_h - h)/2 - 20;
    w = Main_Screen_Width;
    _balanceLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _balanceLbl.textColor= [UIColor blackColor];
    _balanceLbl.font =[UIFont fontWithName:@"Arial-BoldMT" size:40];//[UIFont systemFontOfSize:25];
    
    _balanceLbl.textAlignment  = NSTextAlignmentCenter;
    _balanceLbl.text =@"￥297.50";
    [bgimgview addSubview:_balanceLbl];
    y+=h+10;
    h = 20;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor= [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment  = NSTextAlignmentCenter;
    lbl.text =@"账户余额(元)";
    [bgimgview addSubview:lbl];


    
    x = 30;
    w = (Main_Screen_Width - 60 - 20)/2;
    h = 44;
    y = bgimgview.mj_y + bgimgview.mj_h + 60;
    _withdrawBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_withdrawBtn setTitle:@"提现" forState:0];
    [_withdrawBtn setTitleColor:[UIColor whiteColor] forState:0];
    [_withdrawBtn addTarget:self action:@selector(actionwithdrawBtn) forControlEvents:1<<6];

    _withdrawBtn.titleLabel.font =[UIFont systemFontOfSize:15];
    _withdrawBtn.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:_withdrawBtn];
    ViewRadius(_withdrawBtn, 5);
    x +=w + 20;
    _rechargeBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_rechargeBtn setTitle:@"充值" forState:0];
    [_rechargeBtn setTitleColor:[UIColor whiteColor] forState:0];
    _rechargeBtn.titleLabel.font =[UIFont systemFontOfSize:15];
    _rechargeBtn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    ViewRadius(_rechargeBtn, 5);
    [_rechargeBtn addTarget:self action:@selector(actionChargBtn) forControlEvents:1<<6];
    [self.view addSubview:_rechargeBtn];

    
    y = Main_Screen_Height - 10 - 20;
    _pledgeLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, y, 0, 0)];
    _pledgeLbl.textColor = [UIColor grayColor];
    _pledgeLbl.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:_pledgeLbl];
    
    _pledgeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, y, 0, 0)];
    [_pledgeBtn setTitleColor:self.appColor forState:0];
    _pledgeBtn.titleLabel.font =[UIFont systemFontOfSize:14];

    [self.view addSubview:_pledgeBtn];
    [self pledgeType:0];
    
}
//0 没押金 //1 有押金
//2 有押金 是芝麻
-(void)pledgeType:(NSInteger)index{
   
    CGFloat lx = 0;
    CGFloat bx = 0;

    CGFloat y = _pledgeLbl.mj_y;
    CGFloat lw = 0;
    CGFloat bw = 0;

    CGFloat h = 20;
    
    BOOL isshowwithdrawBtn = YES;
    NSString * lblStr = @"";
    NSString * btnStr = @"";
    NSString * pledgeStr = @"0";
    
    
    if (index == 0) {//0 没押金
        lw = [MCToolsManage heightforString:@"押金 0元" andHeight:h fontSize:14];
        bw = [MCToolsManage heightforString:@"交押金" andHeight:h fontSize:14];
        lx = Main_Screen_Width/2 - 10 - lw;
        bx = Main_Screen_Width/2 + 10;
        lblStr = @"押金 0元";
        btnStr = @"交押金";
        [_pledgeBtn addTarget:self action:@selector(actionAddpledgeBtn) forControlEvents:1<<6 ];

    }
  else  if (index == 1) {//1 有押金
      
      
      lw = [MCToolsManage heightforString:[NSString stringWithFormat:@"押金 %@元",pledgeStr] andHeight:h fontSize:14];
      bw = [MCToolsManage heightforString:@"退押金" andHeight:h fontSize:14];
      lx = Main_Screen_Width/2 - 10 - lw;
      bx = Main_Screen_Width/2 + 10;
      lblStr = [NSString stringWithFormat:@"押金 %@元",pledgeStr];
      btnStr = @"退押金";
      [_pledgeBtn addTarget:self action:@selector(actionbackpledgeBtn) forControlEvents:1<<6 ];

  }
  else  if (index == 2) {//2 有押金 是芝麻
      lw = [MCToolsManage heightforString:@"押金" andHeight:h fontSize:14];
      bw = [MCToolsManage heightforString:@"芝麻信用免费押金用户" andHeight:h fontSize:14];
      CGFloat ww = [MCToolsManage heightforString:@"押金  芝麻信用免费押金用户" andHeight:20 fontSize:14];
      
      lx = (Main_Screen_Width - ww)/2;
      bx = lx + lw + 20;
      lblStr = @"押金";//[NSString stringWithFormat:@"押金",pledgeStr];
      btnStr = @"芝麻信用免费押金用户";
  }




    
    
    
    [_pledgeBtn setTitle:btnStr forState:0];
    _pledgeLbl.text =lblStr;
    _pledgeLbl.frame =CGRectMake(lx, y, lw, h);
    _pledgeBtn.frame =CGRectMake(bx, y, bw, h);

   CGFloat x = 30;
  CGFloat  w = (Main_Screen_Width - 60 - 20)/2;
    h = 44;
    y =_withdrawBtn.mj_y;
    if (isshowwithdrawBtn) {
        _withdrawBtn.frame = CGRectMake(x, y, w, h);
        _rechargeBtn.frame = CGRectMake(x+w + 20, y, w, h);
        
        
    }
    else
    {
        _withdrawBtn.frame = CGRectMake(x, y, 0, 0);
        _rechargeBtn.frame = CGRectMake(30, y, Main_Screen_Width - 60, h);
    }

    
    
}
#pragma mark-交押金
-(void)actionAddpledgeBtn{
    AddpledgeViewController * ctl  =[[AddpledgeViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
    
    
    
}
#pragma mark-充值
-(void)actionChargBtn{
    
    RechargeViewController * ctl =[[RechargeViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
    
}
#pragma mark-提现

-(void)actionwithdrawBtn{
    
    
    withdraw1ViewController * ctl =[[withdraw1ViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
    
}
#pragma mark-退押金

-(void)actionbackpledgeBtn{
    PayStateViewController * ctl =[[PayStateViewController alloc]init];
    ctl.Payindex = 3;
    
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

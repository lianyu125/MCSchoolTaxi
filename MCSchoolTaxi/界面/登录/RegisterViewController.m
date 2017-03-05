//
//  RegisterViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/2.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "RegisterViewController.h"
#import "SetPasswordViewController.h"

@interface RegisterViewController ()
{
    UITextField * phoneText;

    UITextField * VccText;
    
    
    UIButton * vccBtn;
    UIButton *redBtn;
    
    NSTimer *_gameTimer;
    NSDate   *_gameStartTime;

    
}

@end

@implementation RegisterViewController
-(void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    [_gameTimer invalidate];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat w = 80;
    CGFloat h = w;
    CGFloat y = 64 + 40;
    CGFloat x = (Main_Screen_Width -w )/2;
    UIImageView * logoImgView =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    logoImgView.image =[UIImage imageNamed:@"login_logo"];
    [self.view addSubview:logoImgView];
    y+=h+50*MCHeightScale+10;
    x = 40;
    w = 20;
    h =20;
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"login_phone"];
    [self.view addSubview:imgview];
    
    y-=10;
    x +=w + 10;
    w= Main_Screen_Width - 2*x;
    h = 40;
    phoneText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    phoneText.placeholder =@"请输入手机号码";
    phoneText.font =[UIFont systemFontOfSize:15];
    phoneText.textColor = [UIColor grayColor];
    [self.view addSubview:phoneText];
    phoneText.keyboardType =UIKeyboardTypeNumberPad;

    y+=h;
    x = 35;
    w = Main_Screen_Width - 2*x;
    h = 0.5;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    
    [self.view addSubview:lineView];
    
    y+=h+20+10;
    x = 40;
    w = 20;
    h =20;
    imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"login_code"];
    [self.view addSubview:imgview];
    
    CGFloat vccW = [MCToolsManage heightforString:@"获取验证码" andHeight:40 fontSize:14];
    
    y-=10;
    x +=w + 10;
    w= Main_Screen_Width - 2*x -vccW - 5;
    h = 40;
    VccText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    VccText.placeholder =@"请输入验证码";
    VccText.font =[UIFont systemFontOfSize:15];
    VccText.textColor = [UIColor grayColor];
    [self.view addSubview:VccText];
    
    x = Main_Screen_Width - 35 - vccW;
    vccBtn= [[UIButton alloc]initWithFrame:CGRectMake(x, y, vccW, h)];
    [vccBtn setTitle:@"获取验证码" forState:0];
    vccBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [vccBtn setTitleColor:self.appColor forState:0];
    [vccBtn addTarget:self action:@selector(actionvccBtn) forControlEvents:1<<6];

    [self.view addSubview:vccBtn];

    
    
    
    
    y+=h;
    x = 35;
    w = Main_Screen_Width - 2*x;
    h = 0.5;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    
    [self.view addSubview:lineView];
    y += h + 5;
    w = 40;
    h = w;
  
    redBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [redBtn setImage:[UIImage imageNamed:@"btn_chb_square"] forState:UIControlStateNormal];
    [redBtn setImage:[UIImage imageNamed:@"btn_chb_square_pre"] forState:UIControlStateSelected];

    [self.view addSubview:redBtn];
    [redBtn addTarget:self action:@selector(actionydBtn:) forControlEvents:1<<6];
    
    x +=w;
    w = Main_Screen_Width - x - 35;
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"我已仔细查阅并同意《校客用户协议》";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:13];
    [self.view addSubview:lbl];
    UIButton * xieyiBtn =[[UIButton alloc]initWithFrame:CGRectMake(x+60, y, w-60, h)];
    [self.view addSubview:xieyiBtn];
    [xieyiBtn addTarget:self action:@selector(actionxieyi) forControlEvents:1<<6];

    
    y=lineView.mj_h + lineView.mj_y + 60*MCHeightScale;
    h = 40;
    x = 35;
    w = Main_Screen_Width - 2*x;
  UIButton*  btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"下一步" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    [btn addTarget:self action:@selector(actionextbtn) forControlEvents:1<<6];
    btn.backgroundColor = AppCOLOR;
    [self.view addSubview:btn];
    
    
    
    x = 0;
    h = 20;
    y = Main_Screen_Height  - 10 -h;
    w = Main_Screen_Width/2;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text =@"已有账号?";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textAlignment= NSTextAlignmentRight;
    [self.view addSubview:lbl];
    w = [MCToolsManage heightforString:@"立即登录" andHeight:20 fontSize:14]+15;
    x = Main_Screen_Width/2;
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitleColor:self.appColor forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:14];
    [btn setTitle:@"立即登录" forState:0];
    //    [btn addTarget:self action:@selector(actionBackBtn) forControlEvents:1<<6];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(actionbackBtn) forControlEvents:1<<6];
    
    
}
-(void)actionextbtn{
    SetPasswordViewController * ctl =[[SetPasswordViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}
-(void)actionvccBtn{
    [phoneText resignFirstResponder];
    //    [_vccBtn resignFirstResponder];
    [VccText resignFirstResponder];
    _gameStartTime=[NSDate date];
    _gameTimer= [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];

  
    
    
    
}
// 时钟触发执行的方法
- (void)updateTimer:(NSTimer *)sender
{
    NSInteger deltaTime = [sender.fireDate timeIntervalSinceDate:_gameStartTime];
    
    NSString *text = [NSString stringWithFormat:@"%lds",60 - deltaTime];
    
    if (deltaTime>60) {
        [vccBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [vccBtn setUserInteractionEnabled:YES];
        [_gameTimer invalidate];
        return;
    }else
    {
        [vccBtn setTitle:text forState:UIControlStateNormal];
        [vccBtn setUserInteractionEnabled:NO];
        
    }
    
}





-(void)actionydBtn:(UIButton*)btn{
    btn.selected=  !btn.selected;
    
    
}





#pragma mark-协议
-(void)actionxieyi{
    
}
-(void)actionbackBtn{
    
    [self toPopVC];
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

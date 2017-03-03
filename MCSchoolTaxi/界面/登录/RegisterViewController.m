//
//  RegisterViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/2.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    UITextField * phoneText;

    UITextField * VccText;
    
    
    UIButton * vccBtn;
    
    

    
}

@end

@implementation RegisterViewController

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
    
    
    
    y+=h;
    x = 35;
    w = Main_Screen_Width - 2*x;
    h = 0.5;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    
    [self.view addSubview:lineView];
    y += h + 10;
    
    w = [MCToolsManage heightforString:@"忘记密码?" andHeight:20 fontSize:14];
    x = Main_Screen_Width - 35 - w;
    h = 20;
    UIButton*  btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"忘记密码?" forState:0];
    [btn setTitleColor:[UIColor grayColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(actionWjBtn) forControlEvents:1<<6];
    
    
    
    y=lineView.mj_h + lineView.mj_y + 60*MCHeightScale;
    h = 40;
    x = 35;
    w = Main_Screen_Width - 2*x;
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"下一步" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    btn.backgroundColor = AppCOLOR;
    [self.view addSubview:btn];
    
    
    
    x = 0;
    h = 20;
    y = Main_Screen_Height  - 10 -h;
    w = Main_Screen_Width/2;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text =@"还没有账号?";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textAlignment= NSTextAlignmentRight;
    [self.view addSubview:lbl];
    w = [MCToolsManage heightforString:@"立即注册" andHeight:20 fontSize:14]+15;
    x = Main_Screen_Width/2;
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitleColor:self.appColor forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:14];
    [btn setTitle:@"立即注册" forState:0];
    //    [btn addTarget:self action:@selector(actionBackBtn) forControlEvents:1<<6];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(actionresBtn) forControlEvents:1<<6];
    
    
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

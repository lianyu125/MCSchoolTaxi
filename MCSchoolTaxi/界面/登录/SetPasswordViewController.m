//
//  SetPasswordViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/4.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "SetPasswordViewController.h"
#import "RealNameViewController.h"
@interface SetPasswordViewController ()
{
    
    UITextField *PasswordTextField;
    UIButton * seeBtn;
}

@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置密码";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
  CGFloat  y=64 + 44*MCHeightScale+10;
  CGFloat  x = 40;
  CGFloat  w = 20;
  CGFloat  h =20;
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"login_pw"];
    [self.view addSubview:imgview];
    
    y-=10;
    x +=w + 10;
    w= Main_Screen_Width - 2*x - 40;
    h = 40;
    PasswordTextField = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    PasswordTextField.placeholder =@"请输入密码";
    PasswordTextField.font =[UIFont systemFontOfSize:14];
    PasswordTextField.textColor = [UIColor grayColor];
    [self.view addSubview:PasswordTextField];
    seeBtn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width - 40 - 40, y, 40, 40)];
    [seeBtn setImage:[UIImage imageNamed:@"login_see"] forState:UIControlStateNormal];
    [seeBtn setImage:[UIImage imageNamed:@"login_cantsee"] forState:UIControlStateSelected];
    [seeBtn addTarget:self action:@selector(actionSeeBtn:) forControlEvents:1<<6];
    [self.view addSubview:seeBtn];
    y+=h;
    x = 35;
    w = Main_Screen_Width - 2*x;
    h = 0.5;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    
    [self.view addSubview:lineView];

    
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
    

  
    
}
-(void)actionextbtn{
    [PasswordTextField resignFirstResponder];
    RealNameViewController * ctl =[[RealNameViewController alloc]init];
    [self pushNewViewController:ctl];
}
-(void)actionSeeBtn:(UIButton*)btn{
    
    btn.selected =!btn.selected;
    if (btn.selected) {
        PasswordTextField.secureTextEntry = YES;
    }
    else
    {
        PasswordTextField.secureTextEntry = NO;
 
    }
    
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

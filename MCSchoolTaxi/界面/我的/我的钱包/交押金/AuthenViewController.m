//
//  AuthenViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "AuthenViewController.h"

@interface AuthenViewController ()
{
    UITextField * _nameText;
    UITextField * _caridText;

    
    
    
}

@end

@implementation AuthenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"芝麻认证";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat x = 10;
    CGFloat y = 64 + 40;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44 * 2 +0.5;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(view, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:view];
    
    x = 10;
    w = [MCToolsManage heightforString:@"身份证号" andHeight:44 fontSize:14];
    y =0;
    h = 44;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"姓名";
    [view addSubview:lbl];
    y+=h + 0.5;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"身份证号";
    [view addSubview:lbl];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(10, 44, view.mj_w - 20, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [view addSubview:lineView];

    x = 10 + lbl.mj_w + 10;
    w = view.mj_w - x - 10;
    h = 44;
    y = 0;
    _nameText =[[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _nameText.font =[UIFont systemFontOfSize:14];
    _nameText.textColor =[UIColor grayColor];
    [view addSubview:_nameText];
    _nameText.placeholder = @"请填写您的姓名";
    y+=h+0.5;
    
    _caridText =[[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _caridText.font =[UIFont systemFontOfSize:14];
    _caridText.textColor =[UIColor grayColor];
    _caridText.placeholder =@"请填写您的身份证号";
    [view addSubview:_caridText];
    
    
    UIButton* Btn = [[UIButton alloc]initWithFrame:CGRectMake(30, view.mj_h + view.mj_y + 64, Main_Screen_Width - 60, 40)];
    [Btn setTitle:@"去认证" forState:0];
    [Btn setTitleColor:[UIColor whiteColor] forState:0];
    Btn.titleLabel.font =[UIFont systemFontOfSize:15];
    Btn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    [Btn addTarget:self action:@selector(actionBtn) forControlEvents:1<<6];
    
    ViewRadius(Btn, 5);
    
    [self.view addSubview:Btn];

    
}
-(void)actionBtn{
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AddpledgeObjNotification" object:@"1"];
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

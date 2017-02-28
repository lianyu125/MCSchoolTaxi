//
//  AcceptOrderViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "AcceptOrderViewController.h"

@interface AcceptOrderViewController ()
{
    
    
}

@end

@implementation AcceptOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"接单中";
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
    lbl.text = @"请及时联系车主，开启你的租车之旅吧，如需取消订单，请电话联系车主说明情况~~";
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
    y = bgview.mj_h + bgview.mj_y + 10;
    w = Main_Screen_Width - 20;
    h = 44 +MCAdaptiveH(420, 300, 140) + 20;

    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    
    
    x = 0;
    h = 44;
    y = 0;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.text = @"车主图片";
    lbl.textAlignment = NSTextAlignmentCenter;
    [bgview addSubview:lbl];
    
    y = 44;
    w = 140;
    h= MCAdaptiveH(420, 300, w);
    x = (bgview.mj_w - w)/2;
    imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"pic_driver_large_def"];
    
    [bgview addSubview:imgview];
    y  = bgview.mj_y + bgview.mj_h + 20;
    x = 30;

    if (_stateIndex == 1) {
        w = Main_Screen_Width - 60;
        h = 40;
        btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [btn setTitle:@"我要还车" forState:0];
        [btn setTitleColor:[UIColor whiteColor] forState:0];
        btn.titleLabel.font =[UIFont systemFontOfSize:15];
        ViewRadius(btn, 5);
        btn.backgroundColor = AppCOLOR;
        [self.view addSubview:btn];
        

    }
    else
    {
    w =( Main_Screen_Width - 60 - 20)/2;
    h = 40;
     btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"取消订单" forState:0];
    [btn setTitleColor:self.appColor forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewBorderRadius(btn, 5, 1, self.appColor);
    [self.view addSubview:btn];
    x +=w + 20;
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"成功取车" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    btn.backgroundColor = AppCOLOR;
    [self.view addSubview:btn];

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

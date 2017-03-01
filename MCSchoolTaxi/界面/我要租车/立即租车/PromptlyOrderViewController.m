//
//  PromptlyOrderViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/1.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "PromptlyOrderViewController.h"
#import "CSItemSelectView.h"
#import "MCSeleAlertView.h"

@interface PromptlyOrderViewController ()<CSItemSelectViewDelegate,MCSeleAlertViewDelegate,alertviewExtensionDelegate>
{
    UILabel * _typeLbl;
    UIButton * timeBtn;
    UIButton * dayBtn;
    CSItemSelectView *timeselectView;
    CSItemSelectView *dateselectView;
    UIImageView * lineImgView1;
    UIImageView * lineImgView2;
    UIImageView * lineImgView3;
    UIImageView * lineImgView4;
    UILabel * priceLbl;
    MCSeleAlertView* _SeleAlertView;

    NSInteger _seleIndex;//0自行车 1 电动自行 2 电动汽车
    NSString * carStr;

    
    

    UILabel * _timeDateLbl;
    NSTimer *_gameTimer;
    NSDate   *_gameStartTime;
    AlertViewExtension *alert;

}

@end

@implementation PromptlyOrderViewController
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_gameTimer invalidate];
    [_gameTimer fire];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"立即租车";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
#pragma maek-倒计时
-(void)prepareUI2{
    self.title = @"待抢单";
//    [self.view ];
    UIImageView * Bgimgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height- 64)];
    Bgimgview.userInteractionEnabled = YES;
    Bgimgview.image =[UIImage imageNamed:@"bg"];
    [self.view addSubview:Bgimgview];
    
    CGFloat w =250;
    CGFloat h =w;
    CGFloat y =45*MCHeightScale;
    CGFloat x =(Main_Screen_Width - w)/2;
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewBorderRadius(view1, h/2, 15, self.appColor);
    
    [Bgimgview addSubview:view1];
    
    x += 15;
    y +=15;
    w -=30;
    h = w;
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewBorderRadius(view2, h/2, 5,[UIColor whiteColor]);
    
    [Bgimgview addSubview:view2];
    
    x =5;
    w =view2.mj_w - 10;
    y = (h-25)/2;
    h = 25;
    
    _timeDateLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _timeDateLbl.text = @"00:00:00";
    _timeDateLbl.textColor =[UIColor whiteColor];
    _timeDateLbl.font =[UIFont systemFontOfSize:30];
    _timeDateLbl.textAlignment=  NSTextAlignmentCenter;
    [view2 addSubview:_timeDateLbl];
    
    y = view1.mj_y + view1.mj_h + 30;
    w = Main_Screen_Width;
    h = 20;
    x = 0;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor whiteColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.text = @"请耐心等待，玩命叫车中";
    [Bgimgview addSubview:lbl];
    y+=h + 70;
    
    x = 30;
    w = Main_Screen_Width - 60;
    h = 40;
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(30, y, Main_Screen_Width - 60, 40)];
    ViewRadius(btn, 5);
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn setTitle:@"取消订单" forState:0];
    btn.backgroundColor =AppCOLOR;
    [btn addTarget:self action:@selector(actionQXBtn) forControlEvents:1<<6];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [Bgimgview addSubview:btn];
    _gameStartTime=[NSDate date];
    
    _gameTimer= [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    
}
// 时钟触发执行的方法
- (void)updateTimer:(NSTimer *)sender
{
    
    NSInteger deltaTime = [sender.fireDate timeIntervalSinceDate:_gameStartTime];
    
    NSString * ss =  [self getMMSSFromSS:deltaTime];
    _timeDateLbl.text =ss;
    NSLog(@"time ==%@",ss);
    
    
    
}
//传入 秒  得到 xx:xx:xx
-(NSString *)getMMSSFromSS:(NSInteger )seconds{
    
    //    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}
-(void)actionQXBtn{
    
    
    alert =[[AlertViewExtension alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    alert.delegate=self;
    [alert setbackviewframeWidth:300 Andheight:150];
    [alert settipeTitleStr:@"确定要取消订单吗?" Andfont:14];
    alert.sureBtn.backgroundColor =[UIColor whiteColor];
    [alert.sureBtn setTitleColor:[UIColor grayColor] forState:0];
    [alert.cancelBtn setTitle:@"确定" forState:0];
    [alert.sureBtn setTitle:@"取消" forState:0];
    [alert.sureBtn setTitleColor:self.appColor forState:0];
    alert.cancelBtn.backgroundColor =[UIColor whiteColor];
    [alert.cancelBtn setTitleColor:[UIColor grayColor] forState:0];
    
    [self.view addSubview:alert];
    
}
-(void)clickBtnSelector:(UIButton *)btn
{
    [alert removeFromSuperview];
    
    if (btn.tag == 2000) {//
        
        
        [self toPopVC];//取消
        
        
    }
    else
    {
        
        
        
        
    }
}





-(void)prepareUI{
    
    CGFloat x = 10;
    CGFloat y = 64;
    CGFloat h = 44;
    CGFloat w = 200;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"立即租车类型";
    [self.view addSubview:lbl];
    x = Main_Screen_Width - 10 -w;
    _typeLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _typeLbl.textColor = AppCOLOR;
    _typeLbl.font =[UIFont systemFontOfSize:14];
    _typeLbl.textAlignment = NSTextAlignmentRight;
    _typeLbl.text = @"请选择";
    
    [self.view addSubview:_typeLbl];
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width/2, y, Main_Screen_Width/2, h)];
    [btn addTarget:self action:@selector(actionType) forControlEvents:1<<6];
    [self.view addSubview:btn];

    x = 0;
    y = 43.5 + 64;
    h = 0.5;
    w = Main_Screen_Width;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];

    y+=h + 20;
    x = 10;
    w = 30;
    h = w;
    timeBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [timeBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
    
    [timeBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
    timeBtn.selected = YES;
    [timeBtn addTarget:self action:@selector(actionTimeBtn) forControlEvents:1<<6];
    [self.view addSubview:timeBtn];
    x +=w+5;
    w = 200;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"按小时";
    [self.view addSubview:lbl];
    
    x = 10;
    y +=h + 30;
    h = 0.5;
    w = Main_Screen_Width - 20;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];
    y+=h;
    h = 44;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:view];
    y+=h;
    h = 0.5;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];
    
    
    timeselectView = [CSItemSelectView itemSelectViewWithData:[self data] delegate:self selectViewWidth:50 defalutIndex:3];
    timeselectView.frame = CGRectMake(0, 0,  view.mj_w, 44);
    timeselectView.selectTitleColor = AppCOLOR;//[UIColor greenColor];
    timeselectView.selectViewColor = [UIColor clearColor];
    timeselectView.normalTitleColor = [UIColor grayColor];
    timeselectView.titleFont = [UIFont systemFontOfSize:18.0];
    timeselectView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view addSubview:timeselectView];
    
    x =Main_Screen_Width/2 - 25;
    CGFloat ly = lineView.mj_y - 44 -0.5 - 30;
    CGFloat lh = 44+ 60 + 1;
    
    lineImgView1 =[[UIImageView alloc]initWithFrame:CGRectMake(x, ly, 10, lh)];
    lineImgView1.image =[UIImage imageNamed:@"cursor_left"];
    [self.view addSubview:lineImgView1];

    x +=10+30;
    lineImgView2 =[[UIImageView alloc]initWithFrame:CGRectMake(x, ly, 10, lh)];
    lineImgView2.image =[UIImage imageNamed:@"cursor_right"];
    [self.view addSubview:lineImgView2];

    
    
    
    
    
    x = 10;
    y = lineView.mj_y + 0.5 + 40;
    w = 30;
    h = 30;
    
    dayBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [dayBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
    [dayBtn addTarget:self action:@selector(actiondayBtn) forControlEvents:1<<6];

    [dayBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
    [self.view addSubview:dayBtn];

    x +=w+5;
    w = 200;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor =[UIColor darkTextColor];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.text =@"按天";
    [self.view addSubview:lbl];
    x = 10;
    y +=h + 30;
    h = 0.5;
    w = Main_Screen_Width - 20;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];
    y+=h;
    h = 44;
     view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:view];
    y+=h;
    h = 0.5;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];

    dateselectView = [CSItemSelectView itemSelectViewWithData:[self daydata] delegate:self selectViewWidth:50 defalutIndex:3];
    dateselectView.frame = CGRectMake(0, 0,  view.mj_w, 44);
    dateselectView.selectTitleColor =  [UIColor grayColor];//[UIColor greenColor];
    dateselectView.selectViewColor = [UIColor clearColor];
    dateselectView.normalTitleColor = [UIColor grayColor];
    dateselectView.titleFont = [UIFont systemFontOfSize:18.0];
    dateselectView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view addSubview:dateselectView];

    
    x =Main_Screen_Width/2 - 25;
     ly = lineView.mj_y - 44 -0.5 - 30;
    lh = 44+ 60 + 1;
    
    lineImgView3 =[[UIImageView alloc]initWithFrame:CGRectMake(x, ly, 10, lh)];
    lineImgView3.image =[UIImage imageNamed:@"cursor_left"];
    lineImgView3.hidden = YES;
    [self.view addSubview:lineImgView3];
    
    x +=10+30;
    lineImgView4 =[[UIImageView alloc]initWithFrame:CGRectMake(x, ly, 10, lh)];
    lineImgView4.image =[UIImage imageNamed:@"cursor_right"];
    lineImgView4.hidden = YES;

    [self.view addSubview:lineImgView4];
    
    y = lineView.mj_y + 0.5 + 30;
    x = 0;
    w = Main_Screen_Width;
    h = 0.5;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:lineView];

    y +=h + 30;
    x = 30;
    w = Main_Screen_Width - 60;
    h = 20;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"预计租车价格";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:16];
    lbl.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    y+=h + 10;
    priceLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    priceLbl.text = @"50.00元";
    priceLbl.textColor =[UIColor orangeColor];
    priceLbl.font =[UIFont systemFontOfSize:16];
    priceLbl.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:priceLbl];
    y+=h + 20;
    
    x = 30;
    w = Main_Screen_Width - 60;
    h = 40;
    
    
    btn =[[UIButton alloc]initWithFrame:CGRectMake(30, y, Main_Screen_Width - 60, 40)];
    ViewRadius(btn, 5);
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn setTitle:@"去租车" forState:0];
    btn.backgroundColor =AppCOLOR;
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [self.view addSubview:btn];

    [btn addTarget:self action:@selector(actionOK) forControlEvents:1<<6];

    
    
}
-(void)actionOK{
    
    [self prepareUI2];
    
}
#pragma mark-选择车
-(void)actionType{
   
    _SeleAlertView = [[MCSeleAlertView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) MCstyle:_seleIndex];
    _SeleAlertView.deldagate = self;
    [_SeleAlertView showInWindow];
  
}
-(void)MCSeleAlertViewHidden
{
    [_SeleAlertView removeFromSuperview];
}
-(void)MCSeleAlertView:(NSInteger)selectIndex
{
    _seleIndex =selectIndex;
    if (_seleIndex == 0) {
        carStr = @"自行车";
    }
    else if (_seleIndex == 1) {
        carStr = @"电动自行车";
    }else if (_seleIndex == 2) {
        carStr = @"电动汽车";
    }
    [_SeleAlertView removeFromSuperview];
    _typeLbl.text =carStr;
}
-(void)actiondayBtn{
    timeBtn.selected = NO;
    dayBtn.selected = YES;
    timeselectView.selectTitleColor = [UIColor grayColor];
    dateselectView.selectTitleColor = AppCOLOR;
    lineImgView1.hidden = YES;
    lineImgView2.hidden = YES;
    lineImgView3.hidden = NO;
    lineImgView4.hidden = NO;

}
-(void)actionTimeBtn{
    timeBtn.selected = YES;
    dayBtn.selected = NO;
    timeselectView.selectTitleColor = AppCOLOR;//[UIColor grayColor];
    dateselectView.selectTitleColor = [UIColor grayColor];
    lineImgView1.hidden = NO;
    lineImgView2.hidden = NO;
    lineImgView3.hidden = YES;
    lineImgView4.hidden = YES;



    
}
#pragma mark - delegate
- (void)itemSelectView:(CSItemSelectView *)itemView didSelectItem:(NSString *)item atIndex:(NSInteger)index
{
    
    NSLog(@"item---%@,index --- %zd",item,index);
}
//fake data
- (NSArray *)data
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 23; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d",i + 1];
        [array addObject:str];
    }
    return [array copy];
}
- (NSArray *)daydata
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 29; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d",i + 1];
        [array addObject:str];
    }
    return [array copy];
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

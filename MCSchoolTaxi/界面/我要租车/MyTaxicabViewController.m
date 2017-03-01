//
//  MyTaxicabViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/23.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MyTaxicabViewController.h"
#import "MCMapView.h"
#import "CycleScrollView.h"
#import "WaitingOrderViewController.h"
#import "SubscribeViewController.h"
#import "AcceptOrderViewController.h"
#import "WaitPaymentViewController.h"
#import "PromptlyOrderViewController.h"

@interface MyTaxicabViewController ()
{
    
    MCMapView * _MapView;
    UIView * _messageView;
    
    UIButton * _subscribeBtn;//预约
    UIButton * _promptlyBtn;//立即

    
    UIButton * _IngBtn;//中间

    
}
@property (nonatomic , retain) CycleScrollView *mainScorllView;

@end

@implementation MyTaxicabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMapView];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)addMapView{
    
    _MapView = [[MCMapView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64)];
    _MapView.ViewController = self;
    [self.view addSubview:_MapView];
    
    
}
-(void)prepareUI{
    
    CGFloat x = 20;
    CGFloat y = 64 + 10;
    CGFloat w = Main_Screen_Width -2*x;
    CGFloat h = 40;
    
    _messageView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _messageView.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(_messageView, h/2, 1, self.appColor);
    [self.view addSubview:_messageView];
    
    NSArray * arr = @[@"购买会员租车更优惠哦，快点去购买吧",@"购买会员租车更优惠哦，快点去购买吧"];//2条以上
    NSMutableArray *viewsArray = [NSMutableArray array];
    for (int i = 0; i < arr.count; ++i) {
        NSString * s = arr[i];
            UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _messageView.mj_w - 35 - 10 - 20, 40)];
            tempLabel.text =  [NSString stringWithFormat:@"%@",s];
            tempLabel.textColor = [UIColor darkTextColor];
            tempLabel.font = [UIFont systemFontOfSize:13];
//        tempLabel.backgroundColor =[UIColor redColor];
            [viewsArray addObject:tempLabel];
        
    }

    self.mainScorllView = [[CycleScrollView alloc] initWithFrame:CGRectMake(10 + 20 + 5, 0, _messageView.mj_w - 35 - 10 - 20, 40) animationDuration:3];

    self.mainScorllView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        
        return viewsArray[pageIndex];
    };
    self.mainScorllView.totalPagesCount = ^NSInteger(void){
        
        return viewsArray.count;
    };
    [_messageView addSubview:self.mainScorllView];

    self.mainScorllView.TapActionBlock = ^void(NSInteger pageIndex){
        
        NSLog(@"pageIndex == %ld",pageIndex);
        
    };
    x = 10;
    y = 12.5;
    w = 18;
    h = 15;
    UIImageView * imgview=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"map_icon_notice"];
    [_messageView addSubview:imgview];

    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(_messageView.mj_w - 10 - 20, 0, 20, 40)];
    lbl.text = @">";
    lbl.textColor =[UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:15];
//    lbl.textAlignment = NSTextAlignmentRight;
    [_messageView addSubview:lbl];

    
    
    
    w = Main_Screen_Width / 4;
    h = w;
    x = w/2;
    y = Main_Screen_Height - 49 - 30 - h;
    
    _subscribeBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_subscribeBtn addTarget:self action:@selector(actionSubBtn) forControlEvents:1<<6];
//    _subscribeBtn.backgroundColor =[UIColor redColor];
    [_subscribeBtn setImage:[UIImage imageNamed:@"map_btn_book"] forState:0];
    [self.view addSubview:_subscribeBtn];

    x = Main_Screen_Width - w/2 -w;
    _promptlyBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
//    _promptlyBtn.backgroundColor =[UIColor redColor];
    [_promptlyBtn setImage:[UIImage imageNamed:@"map_btn_immediately"] forState:0];
    [_promptlyBtn addTarget:self action:@selector(actionpromptlyBtn) forControlEvents:1<<6];

    [self.view addSubview:_promptlyBtn];

    
    x = (Main_Screen_Width - w)/2;
    
    
    _IngBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    [_IngBtn setImage:[UIImage imageNamed:@"map_btn_on"] forState:0];
    [_IngBtn addTarget:self action:@selector(actionIngBtn:) forControlEvents:1<<6];
//    _IngBtn.hidden = YES;
    _IngBtn.tag = 100;

    [self.view addSubview:_IngBtn];
    
    y -= (10+_IngBtn.mj_h);
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setImage:[UIImage imageNamed:@"map_btn_waiting"] forState:0];
    [btn addTarget:self action:@selector(actionIngBtn:) forControlEvents:1<<6];
    btn.tag = 101;
    //    _IngBtn.hidden = YES;
    [self.view addSubview:btn];
    y -= (10+_IngBtn.mj_h);
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setImage:[UIImage imageNamed:@"map_btn_pay"] forState:0];
    [btn addTarget:self action:@selector(actionIngBtn:) forControlEvents:1<<6];
    btn.tag = 102;
    //    _IngBtn.hidden = YES;
    [self.view addSubview:btn];

    y -= (10+_IngBtn.mj_h);
    btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setImage:[UIImage imageNamed:@"map_btn_give"] forState:0];
    [btn addTarget:self action:@selector(actionIngBtn:) forControlEvents:1<<6];
    btn.tag = 103;
    //    _IngBtn.hidden = YES;
    [self.view addSubview:btn];
    

    
    
}
-(void)actionIngBtn:(UIButton*)btn{
    if (btn.tag == 101) {//待抢单
        WaitingOrderViewController * ctl =[[WaitingOrderViewController alloc]init];
        [self pushNewViewController:ctl];

    }
    else if (btn.tag == 102){
        WaitPaymentViewController * ctl =[[WaitPaymentViewController alloc]init];
        [self pushNewViewController:ctl];
        
  
        
    }
    else if (btn.tag == 103){//接单中
        AcceptOrderViewController * ctl =[[AcceptOrderViewController alloc]init];
        [self pushNewViewController:ctl];

        
    }
    else if (btn.tag == 100){//进行中
        AcceptOrderViewController * ctl =[[AcceptOrderViewController alloc]init];
        ctl.stateIndex = 1;
        [self pushNewViewController:ctl];
        
        
    }

    

    
    
}
#pragma mark-预约
-(void)actionSubBtn{
   
    
    SubscribeViewController * ctl =[[SubscribeViewController alloc]init];
    [self pushNewViewController:ctl];
 
    
    
    
    
}
-(void)actionpromptlyBtn{
    
    PromptlyOrderViewController * ctl =[[PromptlyOrderViewController alloc]init];
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

//
//  SubscribeViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "SubscribeViewController.h"
#import "OrderDetailsTableViewCell.h"
#import "WaitingOrderTableViewCell.h"
#import "MCSeleAlertView.h"
#import "MHDatePicker.h"

@interface SubscribeViewController ()<UITableViewDelegate,UITableViewDataSource,MCSeleAlertViewDelegate,alertviewExtensionDelegate>

{
    AlertViewExtension *alert;
    UITableView *_tableView;
    NSString * beginTimeStr;
    MCSeleAlertView* _SeleAlertView;
    NSInteger _seleIndex;//0自行车 1 电动自行 2 电动汽车
    NSString * carStr;
    NSString *seleTimeStr;
    
    
    UILabel * _timeDateLbl;
    NSTimer *_gameTimer;
    NSDate   *_gameStartTime;

    
}
@property (strong, nonatomic) MHDatePicker *selectTimePicker;

@end

@implementation SubscribeViewController
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_gameTimer invalidate];
    [_gameTimer fire];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"预约租车";
    
    
    [self prepareUI];

//    if (_stateIndex) {
//        [self prepareUI2];
//
//    }
//    else
//    {
//        [self prepareUI];
//    }
    // Do any additional setup after loading the view.
}
#pragma maek-倒计时
-(void)prepareUI2{
    self.title = @"待抢单";
    [_tableView removeFromSuperview];
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
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self prepareHeadView];

    [self prepareFooerView];
    
    
}
-(void)prepareHeadView{
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, MCAdaptiveH(740, 375, Main_Screen_Width))];
    _tableView.tableHeaderView = imgview;
    imgview.image =[UIImage imageNamed:@"photos"];
    
    
    
}
-(void)prepareFooerView{
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    _tableView.tableFooterView = bgview;
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(30, 100 - 40 - 20 -5, Main_Screen_Width - 60, 40)];
    ViewRadius(btn, 5);
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn setTitle:@"提交" forState:0];
    btn.backgroundColor =AppCOLOR;
    [btn addTarget:self action:@selector(actionOK) forControlEvents:1<<6];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:btn];
    
    
}
-(void)actionOK{
    
    [self prepareUI2];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        return 44 * 2 +1;
    }
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row  == 0) {
        
        static NSString * cellid = @"OrderDetailsTableViewCell1";
        
        OrderDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OrderDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell prepareUI2];
        cell.titleLbl.textColor = [UIColor darkTextColor];
        cell.titleLbl.font = [UIFont systemFontOfSize:15];
        cell.titleLbl.text = @"预约租车类型";
        cell.titleSubLbl.text = @"请选择";
        if (carStr.length) {
            cell.titleSubLbl.text =carStr;
        }
        cell.titleSubLbl.textColor = AppCOLOR;
        return cell;
    }
    else if (indexPath.row == 1){
        
        static NSString * cellid = @"WaitingOrderTableViewCell";
        
        WaitingOrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[WaitingOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell prepareUI];
        cell.titleLbl.placeholder = @"请选择租车开始时间";
        cell.titleLbl.text = beginTimeStr;
        cell.titleSubLbl.placeholder = @"请选择租车时长";
        cell.titleSubLbl.text = seleTimeStr;
        [cell.btn1 addTarget:self action:@selector(actionBtn1) forControlEvents:1<<6];
        [cell.btn2 addTarget:self action:@selector(actionBtn2) forControlEvents:1<<6];

        return cell;
        
        
        
        
    }
    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        _SeleAlertView = [[MCSeleAlertView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) MCstyle:_seleIndex];
        _SeleAlertView.deldagate = self;
        [_SeleAlertView showInWindow];
    }
    
    
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
    [_tableView reloadData];
}
#pragma mark-开始时间
-(void)actionBtn1{
    
    _selectTimePicker = [[MHDatePicker alloc] init];
    __weak typeof(self) weakSelf = self;
    __weak typeof(UITableView*) weak_tableView = _tableView;

    
    [_selectTimePicker didFinishSelectedDate:^(NSDate *selectedDate) {

      beginTimeStr  =[weakSelf dateStringWithDate:selectedDate DateFormat:@"YYYY年MM月dd日 HH:mm"];
        [weak_tableView reloadData];
        
    }];
    
 
    
}
- (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    return str ? str : @"";
}
#pragma mark-时长
-(void)actionBtn2{
    
    _SeleAlertView = [[MCSeleAlertView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) MCDateTyle:1 MCstyle:2];
    _SeleAlertView.deldagate = self;
    [_SeleAlertView showAnimateInWindow];
    
    
    
    
    
}
-(void)MCSeleAlertView:(NSInteger)selectDateIndex Index:(NSInteger)index
{
    [_SeleAlertView removeFromSuperview];
    NSString * str = @"";
    if (selectDateIndex == 1) {
        str = [NSString stringWithFormat:@"%ld小时",index];
    }
    else
    {
        str = [NSString stringWithFormat:@"%ld天",index];
  
    }
    NSLog(@"str ===%@",str);
    seleTimeStr =str;
    [_tableView reloadData];
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

//
//  AddpledgeViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "AddpledgeViewController.h"
#import "AddpledgeTableViewCell.h"
#import "AuthenViewController.h"
#import "DepositPayViewController.h"

@interface AddpledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
    UILabel * _pledgeLbl;
    BOOL IsAuthentication;
    UILabel * Authenlbl;
    UIView * resView;
    UIButton *resBtn;
    
}

@end

@implementation AddpledgeViewController

-(void)AddpledgeObj:(NSNotification*)obj
{
    
    
    NSString * str = obj.object;
    
    
    if ([str isEqualToString:@"1"]) {
        [_tableView.tableFooterView removeFromSuperview];
        [_tableView.tableHeaderView removeFromSuperview];

        [self prearehearView2];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"缴纳押金";
    //监听数据的刷新
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AddpledgeObj:) name:@"AddpledgeObjNotification" object:nil];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    if (_iszhimaActionPay) {
        [self prearehearView2];

    }
    else
    {
    [self prearehearView];
    [self preparefooerView];
    }

}
-(void)preparefooerView{
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 200)];
    _tableView.tableFooterView =view;
    
   UIButton* Btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 160, Main_Screen_Width - 60, 40)];
    [Btn setTitle:@"押金支付" forState:0];
    [Btn setTitleColor:[UIColor whiteColor] forState:0];
    Btn.titleLabel.font =[UIFont systemFontOfSize:15];
    Btn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    [Btn addTarget:self action:@selector(actionPayBtn) forControlEvents:1<<6];
    ViewRadius(Btn, 5);
    
    [view addSubview:Btn];

    resView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 40)];
    [view addSubview:resView];
    
    resBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 0, 40, 40)];
    [resBtn setImage:[UIImage imageNamed:@"btn_chb_square"] forState:UIControlStateNormal];
    [resBtn setImage:[UIImage imageNamed:@"btn_chb_square_pre"] forState:UIControlStateSelected];
    [resBtn addTarget:self action:@selector(actionResBtn:) forControlEvents:1<<6];
    [resView addSubview:resBtn];

    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 300, 40)];
    lbl.text = @"我已仔细查阅并同意《押金充值协议》";
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textColor = [UIColor grayColor];
    [resView addSubview:lbl];


    
    
    
}
-(void)prearehearView{
    CGFloat x = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat y = 0;
    CGFloat h = MCAdaptiveH(750, 354, w);
    UIImageView * bgimgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgimgview.image =[UIImage imageNamed:@"bg_cash-pledge"];
    _tableView.tableHeaderView = bgimgview;
    x = 0;
    h = 50;
    y = (bgimgview.mj_h - h)/2;
    w = Main_Screen_Width;
    
    _pledgeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _pledgeLbl.textColor= [UIColor whiteColor];
    _pledgeLbl.font =[UIFont fontWithName:@"Arial-BoldMT" size:40];//[UIFont systemFontOfSize:25];
    
    _pledgeLbl.textAlignment  = NSTextAlignmentCenter;
    _pledgeLbl.text =@"￥297.50";
    [bgimgview addSubview:_pledgeLbl];
    y+=h+10;
    h = 20;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor= [UIColor whiteColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment  = NSTextAlignmentCenter;
    lbl.text =@"押金随时可退，原路退回";
    [bgimgview addSubview:lbl];
    
    x = 10;
    w = Main_Screen_Width- 10;
    h = 20;
    y = 20;
    Authenlbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    Authenlbl.textColor = [UIColor whiteColor];
    Authenlbl.font =[UIFont systemFontOfSize:14];
    Authenlbl.text = @"已认证，还需要缴纳";
    [bgimgview addSubview:Authenlbl];
    
    
    

    
}
-(void)prearehearView2{
    CGFloat x = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat y = 0;
    CGFloat h = MCAdaptiveH(750, 354, w);
    UIImageView * bgimgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgimgview.image =[UIImage imageNamed:@"bg_cash-pledge-light"];
    _tableView.tableHeaderView = bgimgview;
    x = 0;
    h = bgimgview.mj_h;
    y = 0;
    w = Main_Screen_Width;
    
    _pledgeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _pledgeLbl.textColor= [UIColor whiteColor];
    _pledgeLbl.font =[UIFont fontWithName:@"Arial-BoldMT" size:20];//[UIFont systemFontOfSize:25];
    
    _pledgeLbl.textAlignment  = NSTextAlignmentCenter;
    _pledgeLbl.text =@"已认证，恭喜你\n获得免押金租车资格";
    _pledgeLbl.numberOfLines = 0;
    [bgimgview addSubview:_pledgeLbl];


}
-(void)actionResBtn:(UIButton*)btn{
    btn.selected = !btn.selected;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * cellid = @"AddpledgeTableViewCell";
    
    AddpledgeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[AddpledgeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell preareUI];
    if (!IsAuthentication) {
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        cell.accessoryType= UITableViewCellAccessoryNone;
  
    }
    return cell;
    

    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AuthenViewController * ctl =[[AuthenViewController alloc]init];
    [self pushNewViewController:ctl];
    
}
-(void)actionPayBtn{
    DepositPayViewController *ctl =[[DepositPayViewController alloc]init];
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

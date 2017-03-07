//
//  DepositPayViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "DepositPayViewController.h"
#import "AddpledgeTableViewCell.h"
#import "PayStateViewController.h"

@interface DepositPayViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    
    UITableView *_tableView;
    UILabel * _pledgeLbl;

    NSInteger Payindex;//0微信 1支付宝
}

@end

@implementation DepositPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"押金支付";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self prearehearView];
    [self preparefooerView];
    
}
-(void)preparefooerView{
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    _tableView.tableFooterView =view;
    
    UIButton* Btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 60, Main_Screen_Width - 60, 40)];
    [Btn setTitle:@"支付" forState:0];
    [Btn setTitleColor:[UIColor whiteColor] forState:0];
    Btn.titleLabel.font =[UIFont systemFontOfSize:15];
    Btn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    [Btn addTarget:self action:@selector(actionPayBtn) forControlEvents:1<<6];
    ViewRadius(Btn, 5);
    
    [view addSubview:Btn];
    
    
    
    
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
    w = Main_Screen_Width;

    h = [@"￥297.50" boundingRectWithSize:CGSizeMake(w, 1000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial-BoldMT" size:40] forKey:NSFontAttributeName] context:nil].size.height;
    w = [@"￥297.50" boundingRectWithSize:CGSizeMake(100000, h) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial-BoldMT" size:40] forKey:NSFontAttributeName] context:nil].size.width;
    y = (bgimgview.mj_h - h)/2;
    CGFloat lw =[MCToolsManage heightforString:@"押金" andHeight:20 fontSize:15];
    x = (Main_Screen_Width - w - lw - 20)/2;
    
    _pledgeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _pledgeLbl.textColor= [UIColor whiteColor];
    _pledgeLbl.font =[UIFont fontWithName:@"Arial-BoldMT" size:40];//[UIFont systemFontOfSize:25];
    
    _pledgeLbl.textAlignment  = NSTextAlignmentCenter;
    _pledgeLbl.text =@"￥297.50";
    [bgimgview addSubview:_pledgeLbl];
    y=_pledgeLbl.mj_y + _pledgeLbl.mj_h -20;
    h = 20;
    x = _pledgeLbl.mj_x + _pledgeLbl.mj_w + 10;
    w = lw;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor= [UIColor whiteColor];
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment  = NSTextAlignmentCenter;
    lbl.text =@"押金";
    [bgimgview addSubview:lbl];
    
  
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
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
    
    
    [cell prepareUI2];
    if (indexPath.row == 0) {
        cell.imgView.image =[UIImage imageNamed:@"icon_wechat"];
        cell.titleLbl.text = @"微信支付";
        cell.seleBtn.selected = Payindex == 0? YES:NO;
        
        return cell;

    }
    else if (indexPath.row == 1){
        
        cell.imgView.image =[UIImage imageNamed:@"icon_alipay"];
        cell.titleLbl.text = @"支付宝支付";
        cell.seleBtn.selected = Payindex == 1? YES:NO;
        return cell;


    }
    return cell;
//
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        Payindex =0;
        
    }
    else
    {
        Payindex =1;
  
    }
    [_tableView reloadData];
    
}
-(void)actionPayBtn{
    
    PayStateViewController * ctl =[[PayStateViewController alloc]init];
    ctl.Payindex = 1;
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

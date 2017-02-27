//
//  MeViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/23.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MeViewController.h"
#import "MeViewTableViewCell.h"
#import "PersonalDataViewController.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    
    NSArray * titleArray;
    NSArray * imgArray;

    UITableView *_tableView;
    
    
    
    
    UIButton *_headBtn;
    UILabel * _nameLbl;
    UILabel *_timeLbl;
    UIImageView *_VipImgview;
    UIImageView * _statusimgview;//之分
    
    
    
    
    
}

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.tabBarItem.title = @"我的";
    titleArray = @[
                   @[@"我的钱包",@"我的代金券",@"接单历史",@"我的行程"],
                   @[@"计费规则",@"消息中心",@"购买会员"],
                   @[@"保险",@"设置"]
                   
                   ];
    imgArray = @[
                 @[@"me_icon_wallet",@"me_icon_coupon",@"me_icon_list",@"me_icon_schedule"],
                 @[@"me_icon_like",@"me_icon_message",@"me_icon_id"],
                 @[@"me_icon_money",@"me_icon_setting"]
                 
                 
                 
                 ];
    
    
    
    [self prepareUI];
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64-49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self prepareHearView];
    
}
-(void)prepareHearView{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat h = MCAdaptiveH(750, 400, w);
    
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _tableView.tableHeaderView = bgview;
    UIImageView * bgimgview =[[UIImageView alloc]initWithFrame:bgview.bounds];
    bgimgview.image =[UIImage imageNamed:@"me_bg"];
    bgimgview.userInteractionEnabled =YES;
    [bgview addSubview:bgimgview];
    
    
    w = 60;
    y = 20*MCHeightScale;
    h = w;
    x = (Main_Screen_Width - w)/2;
    _headBtn=[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headBtn setBackgroundImage:[UIImage imageNamed:@"me_head"] forState:0];
    ViewBorderRadius(_headBtn, h/2, 2, self.appColor);
    [_headBtn addTarget:self action:@selector(actionHradBtn) forControlEvents:1<<6];
    [bgimgview addSubview:_headBtn];
    CGFloat lw = [MCToolsManage heightforString:@"我的积分" andHeight:25 fontSize:14] + 20;
    _statusimgview=[[UIImageView alloc]initWithFrame:CGRectMake(0, y, lw, 25)];
    _statusimgview.image =[UIImage imageNamed:@"label_status-bar"];
    [bgimgview addSubview:_statusimgview];

    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, lw, 25)];
    lbl.textColor =[UIColor whiteColor];
    lbl.text = @"我的积分";
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textAlignment = NSTextAlignmentCenter;
    [_statusimgview addSubview:lbl];

    
    
    
    y +=h + 8*MCHeightScale;
    x = 0;
    w = Main_Screen_Width;
    h = 20;
    _nameLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _nameLbl.text = @"michan";
    _nameLbl.textColor =[UIColor whiteColor];
    _nameLbl.textAlignment = NSTextAlignmentCenter;
    [bgimgview addSubview:_nameLbl];

    h = 20;
    y = bgimgview.mj_h - 10 -h;
    _timeLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _timeLbl.text = @"(剩余时间150小时50分)";
    _timeLbl.font = [UIFont systemFontOfSize:14];
    _timeLbl.textColor =[UIColor whiteColor];
    _timeLbl.textAlignment = NSTextAlignmentCenter;
    [bgimgview addSubview:_timeLbl];
    h = 20;
    w = MCAdaptiveW(270, 60, 20);
    
    y -= (8 +h);
    x = (Main_Screen_Width - w)/2;
    _VipImgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _VipImgview.image =[UIImage imageNamed:@"me_label_vip_gold"];
    [bgimgview addSubview:_VipImgview];


    
    
    
    
}
#pragma mark-点击头像
-(void)actionHradBtn{
    
    PersonalDataViewController * ctl =[[PersonalDataViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    else if (section ==1)
    return 3;
    else if (section == 2)
        return 2;
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 30;
    }
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * cellid = @"MeViewTableViewCell";
    
    MeViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[MeViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell prepareUI];
    cell.imgView.image =[UIImage imageNamed:imgArray[indexPath.section][indexPath.row]];
    cell.titleLbl.text = titleArray[indexPath.section][indexPath.row];
    if(indexPath.section == 1&&indexPath.row == 1){
        cell.hongView .hidden = NO;
        return cell;

    }
    else
    {
        cell.hongView .hidden = YES;
        return cell;

    }
    

    return [[UITableViewCell alloc]init];
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

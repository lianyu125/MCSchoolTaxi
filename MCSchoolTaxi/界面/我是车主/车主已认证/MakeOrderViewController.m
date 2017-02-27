//
//  MakeOrderViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/24.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MakeOrderViewController.h"
#import "OrderViewTableViewCell.h"
#import "OrderDetailsViewController.h"

@interface MakeOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    
    UITableView *_tableView;
    
}

@end

@implementation MakeOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 64 - 44 - 49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = AppMCBgCOLOR;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125 + 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"OrderViewTableViewCell";
    
    OrderViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[OrderViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.OrderIndex = 0;

    [cell prepareUI];
    return cell;
    

    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 待抢单   2接单中  3进行中 4待付款

    OrderDetailsViewController * ctl =[[OrderDetailsViewController alloc]init];
 
        ctl.stateIndex =1;
    
    ctl.typeIndex = 1;
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

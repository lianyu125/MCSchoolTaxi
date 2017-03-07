//
//  MyScheduleViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MyScheduleViewController.h"
#import "OrderViewTableViewCell.h"
#import "OrderDetailsViewController.h"

@interface MyScheduleViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    
    
    UITableView *_tableView;

    
    
}

@end

@implementation MyScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的行程";
    [self prepareUI];
    // Do any additional setup after loading the view.
}

-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
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
    return 135;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"OrderViewTableViewCell";
    
    OrderViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[OrderViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell prepareUI2];
    
    return cell;
    
    
    
    
    return [[UITableViewCell alloc]init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        OrderDetailsViewController * ctl =[[OrderDetailsViewController alloc]init];
        ctl.pushIndex = 1;
        ctl.stateIndex= 6;
        ctl.typeIndex = 2;
        [self pushNewViewController:ctl];

    }
    else
    {
    OrderDetailsViewController * ctl =[[OrderDetailsViewController alloc]init];
    ctl.pushIndex = 1;
    ctl.stateIndex= 5;
    ctl.typeIndex = 1;
    [self pushNewViewController:ctl];
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

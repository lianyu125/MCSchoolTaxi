//
//  OrderDetailsViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/27.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "OrderDetailsViewController.h"
#import "OrderDetailsTableViewCell.h"

@interface OrderDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView*_tableView;
    
}

@end

@implementation OrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    if (_stateIndex == 2 ||_stateIndex == 3) {
        [self prepareFooerView];

    }
}
-(void)prepareFooerView{
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    _tableView.tableFooterView = bgview;
    
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(30, 100 - 40 - 20 -5, Main_Screen_Width - 60, 40)];
    ViewRadius(btn, 5);
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    if (_stateIndex == 2) {
        [btn setTitle:@"取消订单" forState:0];
        btn.backgroundColor =[UIColor orangeColor];
        
        UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(30, 100 - 20, Main_Screen_Width - 60, 20)];
        lbl.text =@"温馨提示:如需取消，请先向用户说明情况。";
        lbl.font =[UIFont systemFontOfSize:13];
        lbl.textColor =[UIColor grayColor];
        [bgview addSubview:lbl];
        
        
    }
    else
    {
        [btn setTitle:@"确认还车" forState:0];
        btn.backgroundColor = AppCOLOR;
    }
    
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:btn];
    
    
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_stateIndex == 1||_stateIndex == 2) {
        return 3;
    }
    else if (_stateIndex == 3||_stateIndex == 4||_stateIndex == 5||_stateIndex == 6){
        return 4;
    }
    
    return 0;
  
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section ==1){
        return 2;
    }
    else if (section == 2){
        return 1;
    }
    else
    {
        return 1;
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 125;
    }
    else if (indexPath.section ==1){
        return 44;
    }
    else{
        return 8*2 +5 + 20*2;
    }
    
    
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString * cellid = @"OrderDetailsTableViewCell";
        
        OrderDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OrderDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.stateIndex =_stateIndex;
        cell.typeIndex = _typeIndex;
        cell.pushIndex = _pushIndex;
        [cell prepareUI1];
        return cell;

    }
    if (indexPath.section == 1) {
        static NSString * cellid = @"OrderDetailsTableViewCell1";
        
        OrderDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OrderDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell prepareUI2];
        if (indexPath.row == 0) {
            cell.titleLbl.text = @"订单类型";
            if (_typeIndex == 1) {
               cell.titleSubLbl.text = @"预约";
                return cell;

            }
            else
            {
                cell.titleSubLbl.text = @"即时";
                return cell;

 
            }
            
            
        }
        else
        {
            cell.titleLbl.text = @"订单状态";
            //1 待抢单   2接单中  3进行中 4待付款

            if (_stateIndex == 1) {
                 cell.titleSubLbl.text = @"待抢单";
                return cell;

            }
            else if (_stateIndex == 2){
                cell.titleSubLbl.text = @"接单中";
                return cell;


            }
            else if (_stateIndex == 3){
                cell.titleSubLbl.text = @"进行中";
                return cell;

                
            }
            else if (_stateIndex == 4){
                cell.titleSubLbl.text = @"待付款";
                return cell;

                
            }
            else if (_stateIndex == 5){
                cell.titleSubLbl.text = @"已完成";
                return cell;
                
                
            }
            else if (_stateIndex == 6){
                cell.titleSubLbl.text = @"已取消";
                return cell;
                
                
            }



        }
        
                return cell;
        
    }
    if (indexPath.section == 2) {
        static NSString * cellid = @"OrderDetailsTableViewCell2";
        
        OrderDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OrderDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        [cell prepareUI3];
        cell.titleSubLbl.text = @"2017-09-09 13:22:22";
        cell.titleSubLbl2.text = @"12321321321321322323";
        
        
        return cell;
        
    }
    if (indexPath.section == 3) {
        static NSString * cellid = @"OrderDetailsTableViewCell3";
        
        OrderDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OrderDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        [cell prepareUI3];
        cell.titleLbl.text = @"租车时长";
        cell.titleLbl2.text = @"应收费用";
        cell.titleSubLbl.text = @"0天12小时49分";
        cell.titleSubLbl2.text = @"￥10.00";
        if (_stateIndex == 5) {
            cell.titleLbl2.text = @"收到费用";
            return cell;

        }
        else if (_stateIndex == 6){
            cell.titleLbl.text = @"取消订单时间";
            cell.titleSubLbl.text = @"2016-09-09 12:21:21";
            cell.titleLbl2.text = @"取消人";
            cell.titleSubLbl2.text = @"michan";

            return cell;

        }
        
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

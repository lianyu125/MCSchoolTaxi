//
//  WaitingOrderViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "WaitingOrderViewController.h"
#import "OrderDetailsTableViewCell.h"
#import "WaitingOrderTableViewCell.h"

@interface WaitingOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
}

@end

@implementation WaitingOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"待抢单";
    [self prepareUI];
    // Do any additional setup after loading the view.
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
    [btn setTitle:@"取消订单" forState:0];
    btn.backgroundColor =AppCOLOR;

    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:btn];

    
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
        cell.titleSubLbl.text = @"自行车";
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
        cell.titleLbl.text = @"09月03日20分";
        cell.titleSubLbl.text = @"1小时";
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

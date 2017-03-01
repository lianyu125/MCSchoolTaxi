//
//  MyDiscountViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/1.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MyDiscountViewController.h"
#import "MyDiscountTableViewCell.h"

@interface MyDiscountViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView*_tableView;
    
}

@end

@implementation MyDiscountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的代金劵";
    [self prepareUI];
    // Do any additional setup after loading the view.
}

-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =AppMCBgCOLOR;
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [self prepareheaView];
    
}
-(void)prepareheaView{
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 40)];
    _tableView.tableHeaderView = view;
   CGFloat w = [MCToolsManage heightforString:@"优惠劵规则" andHeight:40 fontSize:14];
    CGFloat x = Main_Screen_Width - 10 - w;
    CGFloat y = 0;
    CGFloat h = 40;
    UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text =@"优惠劵规则";
    lbl.textColor = AppCOLOR;
    lbl.font = [UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    w = 15;
    h = 15;
    y = (40-15)/2;
    x -=(5+h);
    UIImageView *imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"icon_rule"];
    [view addSubview:imgview];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, Main_Screen_Width -x, 40)];
    [view addSubview:btn];

    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = MCAdaptiveH(734, 264, Main_Screen_Width - 0);
    
    return h;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"MyDiscountTableViewCell";
    
    MyDiscountTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[MyDiscountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI];
    return cell;
    

    
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

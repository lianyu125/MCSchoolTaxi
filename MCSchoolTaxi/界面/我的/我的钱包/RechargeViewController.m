//
//  RechargeViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/6.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "RechargeViewController.h"
#import "AddpledgeTableViewCell.h"
#import "PayStateViewController.h"
@interface RechargeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>


{
    
    UITableView *_tableView;
    NSInteger Payindex;//0微信 1支付宝

    UITextField * numText;
    
}

@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
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
-(void)prearehearView{
    CGFloat x = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat y = 0;
    CGFloat h = 44 + 40;
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _tableView.tableHeaderView =bgview;
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(10, 20, Main_Screen_Width - 20, 44)];
    view.backgroundColor =[UIColor whiteColor];
    [bgview addSubview:view];
    
    ViewRadius(view, 3);
    
    x = 10;
    w = 100;
    y = 0;
    h = 44;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"充值金额";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    x = view.mj_w - 10 - 20;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"元";
    lbl.textColor =[UIColor grayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    
    x = view.mj_w - 10 - 20 - 5 - 150;
    w = 150;
    y = 0;
    h = 44;
    numText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    numText.font =[UIFont systemFontOfSize:14];
    numText.textColor =[UIColor grayColor];
    numText.textAlignment = NSTextAlignmentRight;
    numText.delegate = self;
    numText.placeholder = @"0.00（不低于10元）";
    [view addSubview:numText];

    
}

-(void)preparefooerView{
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    _tableView.tableFooterView =view;
    
    UIButton* Btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 60, Main_Screen_Width - 60, 40)];
    [Btn setTitle:@"充值" forState:0];
    [Btn setTitleColor:[UIColor whiteColor] forState:0];
    Btn.titleLabel.font =[UIFont systemFontOfSize:15];
    Btn.backgroundColor= AppCOLOR; //[UIColor orangeColor];
    [Btn addTarget:self action:@selector(actionPayBtn) forControlEvents:1<<6];
    ViewRadius(Btn, 5);
    
    [view addSubview:Btn];
    
    
    
    
    
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
    ctl.Payindex = 2;
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

//
//  RealNameViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/5.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "RealNameViewController.h"
#import "RealNameTableViewCell.h"
#import "SeleCtSchoolViewController.h"
#import "RealName2ViewController.h"

@interface RealNameViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITableView * _tableView;
    NSArray * _iconArray;
    NSArray * _textArray;
    

    
    NSString * _nameStr;
    NSString * _caridStr;
    NSString * _schoolStr;
    NSString * _hallStr;
    NSInteger sexIndx;//1男。2女
    


}

@end

@implementation RealNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
    _iconArray = @[@"icon_name",@"icon_id",@"icon_school",@"icon_hall"];
    _textArray = @[@"请输入真实姓名",@"请输入身份证号码",@"请选择学校",@"请输入宿舍楼名称"];

    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self prepareFooerView];
}
-(void)prepareFooerView{
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat h = 200;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _tableView.tableFooterView = view;
    
    y=100;
    h = 40;
    x = 35;
    w = Main_Screen_Width - 2*x;
  UIButton*  btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"下一步" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    btn.backgroundColor = AppCOLOR;
    [btn addTarget:self action:@selector(actionnextBtn) forControlEvents:1<<6];
    [view addSubview:btn];
    

    
    
}
-(void)actionnextBtn{
    
    RealName2ViewController * ctl =[[RealName2ViewController alloc]init];
    [self pushNewViewController:ctl];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"RealNameTableViewCell";
    
    RealNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[RealNameTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    

    if (indexPath.section == 0) {
        
    [cell prepareUI];
        cell.iconImgview.image =[UIImage imageNamed:_iconArray[indexPath.row]];
        cell.TextField.placeholder = _textArray[indexPath.row];
        cell.TextField.userInteractionEnabled=  YES;
        cell.accessoryType =UITableViewCellAccessoryNone;
        cell.TextField.tag = indexPath.row + 100;
        cell.TextField.delegate = self;
        if (indexPath.row == 0) {
            cell.TextField.text = _nameStr;
            return cell;

        }
        else if (indexPath.row == 1){
            cell.TextField.text = _caridStr;
            return cell;


        }
      else  if (indexPath.row == 2) {
            cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
            cell.TextField.userInteractionEnabled=  NO;
            return cell;

        }
      else if (indexPath.row == 1){
          cell.TextField.text = _hallStr;
          return cell;


      }
    return cell;
    
    
    }
    else if (indexPath.section == 1){
        [cell prepareUI2];
        cell.sexMBtn.selected = sexIndx == 1 ? YES:NO;
        cell.sexFBtn.selected = sexIndx == 2 ? YES:NO;

        [cell.sexFBtn addTarget:self action:@selector(actionSexFbtn:) forControlEvents:1<<6];
        [cell.sexMBtn addTarget:self action:@selector(actionSexMbtn:) forControlEvents:1<<6];

        return cell;
        
        
    }
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            SeleCtSchoolViewController * ctl =[[SeleCtSchoolViewController alloc]init];
            [self pushNewViewController:ctl];
        }
    }
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 100) {
        _nameStr =textField.text;
    }
    else if (textField.tag == 101){
        
        _caridStr = textField.text;
    }
    else if (textField.tag == 102){
        _schoolStr = textField.text;

        
    }
    else if (textField.tag == 103){
        
        _hallStr = textField.text;

    }

    
    
    
}
-(void)actionSexFbtn:(UIButton*)btn{//女
    
    btn.selected = YES;
    sexIndx = 2;
    [_tableView reloadData];
    
    
}
-(void)actionSexMbtn:(UIButton*)btn{//男
    
    btn.selected = YES;
    sexIndx = 1;
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

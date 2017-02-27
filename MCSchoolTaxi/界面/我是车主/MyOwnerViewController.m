//
//  MyOwnerViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/23.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MyOwnerViewController.h"
#import "OwnerAuthenViewController.h"
#import "MerchantAutherViewController.h"
#import "ZJScrollPageView.h"
#import "MakeOrderViewController.h"
#import "ImmeOrderViewController.h"
#import "SucceedOrderViewController.h"

@interface MyOwnerViewController ()<ZJScrollPageViewDelegate>
{
    
    UITextField * _nametextField;
    UITextField * _idCardtextField;
    UITextField * _schooltextField;
    UIButton *_personageBtn;
    UIButton *_merchantBtn;
    UIButton *_resBtn;
    
    
    
}
@property(strong, nonatomic)NSArray<NSString *> *titles;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;

@end

@implementation MyOwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_indexView == 1) {
        [self prepareUI1];

    }
    else
    [self prepareUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    style.scrollLineColor = RGBCOLOR(92, 170, 248);
    style.normalTitleColor = RGBCOLOR(102, 102, 102);
    style.selectedTitleColor = RGBCOLOR(92, 170, 248);
    style.segmentHeight = 44;
    style.autoAdjustTitlesWidth = YES;
    self.titles = @[@"预约订单",
                    @"即时订单",
                    @"已抢单(0)"
                    ];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    scrollPageView.segmentView.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@", self.view);
    
    //    scrollPageView.extraBtnOnClick = ^(UIButton *btn){
    //        NSLog(@"ffff");
    //    };
    [self.view addSubview:scrollPageView];
    

    
    
}
- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}


- (void)setUpTitleView:(ZJTitleView *)titleView forIndex:(NSInteger)index {
    //    titleView.label.backgroundColor = [UIColor redColor];
    titleView.label.layer.cornerRadius = 15;
    titleView.label.layer.masksToBounds = YES;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    
    
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    
    
    if (!childVc) {
        if (index == 0) {
            childVc = [[MakeOrderViewController alloc]init];
        }
        else if (index == 1)
        {
            childVc = [[ImmeOrderViewController alloc]init];
            
        }
        else if (index == 2)
        {
            childVc = [[SucceedOrderViewController alloc]init];
            
        }
        
        
    }
    
    return childVc;
}


//认证前
-(void)prepareUI1{
//   self.tabBarItem.title = @"成为车主";
   self.title = @"成为车主";
    CGFloat x = 10;
    CGFloat y = 64 + 30;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44 * 4 + 0.5 * 3;
    UIView * bgView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewBorderRadius(bgView, 5, 0.5, [UIColor groupTableViewBackgroundColor]);
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    x = 10;
    w = [MCToolsManage heightforString:@"服务的学校" andHeight:44 fontSize:14];
    y = 0;
    h = 44;
    NSArray * titleArray = @[@"真实姓名",@"身份证号",@"角色",@"服务的学校"];
    
    for (NSInteger i = 0 ; i <titleArray.count; i++) {
        NSString * str =titleArray[i];
        UILabel * titleLbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        titleLbl.textColor = [UIColor grayColor];
        titleLbl.font = [UIFont systemFontOfSize:14];
        [bgView addSubview:titleLbl];
        titleLbl.text = str;
        UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y +h, bgView.mj_w - 2*x, 0.5)];
        lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [bgView addSubview:lineView];

        if (i == 0) {
            _nametextField = [[UITextField alloc]initWithFrame:CGRectMake(x +w + 10, y, bgView.mj_w - (x +w + 10) - 10, 44)];
            _nametextField.placeholder = @"请输入真实姓名";
            _nametextField.font = [UIFont systemFontOfSize:14];
            [bgView addSubview:_nametextField];

        }
        else if (i == 1){
            _idCardtextField = [[UITextField alloc]initWithFrame:CGRectMake(x +w + 10, y, bgView.mj_w - (x +w + 10) - 10, 44)];
            _idCardtextField.placeholder = @"请输入身份证号";
            _idCardtextField.font = [UIFont systemFontOfSize:14];
            [bgView addSubview:_idCardtextField];
    
            
            
        }
        else if (i == 2){
            _personageBtn = [[UIButton alloc]initWithFrame:CGRectMake(x +w + 10, y, 44, 44)];
            [_personageBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:0];
            [_personageBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
            [_personageBtn addTarget:self action:@selector(actionpersonageBtn:) forControlEvents:1<<6];
            [bgView addSubview:_personageBtn];

            UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x +w + 10+44, y, 64, 44)];
            lbl.textColor = [UIColor grayColor];
            lbl.text = @"个人车主";
            lbl.font = [UIFont systemFontOfSize:14];
            [bgView addSubview:lbl];

            _merchantBtn = [[UIButton alloc]initWithFrame:CGRectMake(lbl.mj_x + lbl.mj_w, y, 44, 44)];
            [_merchantBtn setImage:[UIImage imageNamed:@"btn_chb"] forState:0];
            [_merchantBtn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
            [_merchantBtn addTarget:self action:@selector(actionmerchantBtn:) forControlEvents:1<<6];

            [bgView addSubview:_merchantBtn];
            lbl =[[UILabel alloc]initWithFrame:CGRectMake(_merchantBtn.mj_x+44, y, 64, 44)];
            lbl.textColor = [UIColor grayColor];
            lbl.text = @"租车行";
            lbl.font = [UIFont systemFontOfSize:14];
            [bgView addSubview:lbl];
            
            
        }

        else if (i == 3){
            _schooltextField = [[UITextField alloc]initWithFrame:CGRectMake(x +w + 10, y, bgView.mj_w - (x +w + 10) - 10, 44)];
            _schooltextField.placeholder = @"请选择学校";
            _schooltextField.font = [UIFont systemFontOfSize:14];
            _schooltextField.userInteractionEnabled = NO;
            [bgView addSubview:_schooltextField];
            UIButton * seleSchoolBtn = [[UIButton alloc]initWithFrame:CGRectMake(x +w + 10, y, bgView.mj_w - (x +w + 10) - 10, 44)];
            [seleSchoolBtn addTarget:self action:@selector(actionseleSchoolBtn) forControlEvents:1<<6];

            [bgView addSubview:seleSchoolBtn];

            
        }
        
        if (i +1 <titleArray.count) {
            y+=h + 0.5;
           

        }
        
    }
    
    x = bgView.mj_x + 5;
    y = bgView.mj_h + bgView.mj_y + 8;
    w =30;
    h = 30;
    _resBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_resBtn setImage:[UIImage imageNamed:@"btn_chb_square"] forState:UIControlStateNormal];
    [_resBtn setImage:[UIImage imageNamed:@"btn_chb_square_pre"] forState:UIControlStateSelected];
    [_resBtn addTarget:self action:@selector(action_resBtn:) forControlEvents:1<<6];
    _resBtn.selected = YES;
    [self.view addSubview:_resBtn];
    x +=w +3;
    w = Main_Screen_Width - x - 10;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    lbl.text = [NSString stringWithFormat:@"我已仔细查阅并同意《%@用户协议》",[MCToolsManage app_Name]];
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textColor = [UIColor grayColor];
    [self.view addSubview:lbl];
    w = [MCToolsManage heightforString:lbl.text andHeight:30 fontSize:14];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x + 60, y, w - 60, 30)];
    [btn addTarget:self action:@selector(actionlookBtn) forControlEvents:1<<6];

    [self.view addSubview:btn];


    
    UIButton * okBtn =[[UIButton alloc]initWithFrame:CGRectMake(30, y + 30 + 50, Main_Screen_Width - 2*30, 40)];
    okBtn.backgroundColor = AppCOLOR;
    [okBtn setTitle:@"下一步" forState:0];
    okBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [okBtn setTitleColor:[UIColor whiteColor] forState:0];
    ViewRadius(okBtn, 5);
    [okBtn addTarget:self action:@selector(actionOKBtn) forControlEvents:1<<6];
    [self.view addSubview:okBtn];

    
    
    
    
}
#pragma mark-下一步
-(void)actionOKBtn{
    if (_merchantBtn.selected) {
        MerchantAutherViewController * ctl =[[MerchantAutherViewController alloc]init];
        [self pushNewViewController:ctl];
 
    }
    else if (_personageBtn.selected){
        OwnerAuthenViewController * ctl =[[OwnerAuthenViewController alloc]init];
        [self pushNewViewController:ctl];

    }
    else
    {
        [self showAllTextDialog:@"请选择角色"];
        return;
    }
    
    
    
    
}
-(void)actionlookBtn{
    
}
-(void)action_resBtn:(UIButton*)btn{
    btn.selected = !btn.selected;
}
-(void)actionpersonageBtn:(UIButton*)btn{
    _merchantBtn.selected = NO;
    btn.selected = !btn.selected;
    
    
}
-(void)actionmerchantBtn:(UIButton*)btn{
    _personageBtn.selected = NO;
    btn.selected = !btn.selected;
    
}
-(void)actionseleSchoolBtn{
    
    
    
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

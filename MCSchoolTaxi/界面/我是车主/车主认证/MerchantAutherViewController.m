//
//  MerchantAutherViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/24.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MerchantAutherViewController.h"
#import "MerchantAutherTableViewCell.h"
#import "ZYQAssetPickerController.h"
#import "MapSelectViewController.h"

@interface MerchantAutherViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZYQAssetPickerControllerDelegate,alertviewExtensionDelegate,UITextFieldDelegate>
{
    
    UITableView *_tableView;
    AlertViewExtension *alert;
    
    UIButton * _addIdCardZ;
    UIButton * _addIdCardF;
    
    NSInteger _IdCardindex;//1为正 2为反
    UIImage *img1;
    UIImage *img2;
    
    
    NSString * nameStr;
    NSString * addStr;
    NSString * ZnumStr;
    NSString * DnumStr;
    NSString * DQnumStr;

    NSMutableArray *textArray;
    
    

}

@end

@implementation MerchantAutherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车主认证";
    textArray =[NSMutableArray array];
    [textArray addObject:nameStr?nameStr:@""];
    [textArray addObject:addStr?addStr:@""];
    [textArray addObject:ZnumStr?ZnumStr:@""];
    [textArray addObject:DnumStr?DnumStr:@""];
    [textArray addObject:DQnumStr?DQnumStr:@""];

    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = AppMCBgCOLOR;
    [self.view addSubview:_tableView];
    [self preparefooerView];
    
}
-(void)preparefooerView{
    
    
    
    
    
   CGFloat y = 0;
   CGFloat x = 30;
   CGFloat w = Main_Screen_Width - x * 2;
   CGFloat h = MCAdaptiveH(625, 253, w);
    CGFloat vh = h * 2 + 15 +5 + 20 + 30 + 40 + 40;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, vh)];
//    bgView.backgroundColor =[UIColor whiteColor];
    _tableView.tableFooterView =bgView;
    
    UIView * idCardView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    //    idCardView.backgroundColor = [UIColor whiteColor];
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, idCardView.mj_w, idCardView.mj_h);
    borderLayer.position = CGPointMake(CGRectGetMidX(borderLayer.bounds), CGRectGetMidY(borderLayer.bounds));
    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@3, @3];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    [idCardView.layer addSublayer:borderLayer];
    [bgView addSubview:idCardView];
  CGFloat  lw = [MCToolsManage heightforString:@"添加车行正面图(含店名)" andHeight:20 fontSize:14];
    
    CGFloat lx = (idCardView.mj_w - lw)/2;
    CGFloat ly = (idCardView.mj_h - 20)/2;
  UILabel*  lbl = [[UILabel alloc]initWithFrame:CGRectMake(lx, ly, lw, 20)];
    lbl.text = @"添加车行正面图(含店名)";
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textColor = [UIColor grayColor];
    [idCardView addSubview:lbl];
    UIImageView * addimgView =[[UIImageView alloc]initWithFrame:CGRectMake(lx - 5 - 20, ly, 20, 20)];
    addimgView.image =[UIImage imageNamed:@"card_add"];
    [idCardView addSubview:addimgView];
    
    
    _addIdCardZ = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, idCardView.mj_w, idCardView.mj_h)];
    [idCardView addSubview:_addIdCardZ];
    [_addIdCardZ addTarget:self action:@selector(actionAddidcard:) forControlEvents:1<<6];
    
    
    
    y +=h + 15;
    idCardView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    //    idCardView.backgroundColor = [UIColor whiteColor];
    borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, idCardView.mj_w, idCardView.mj_h);
    borderLayer.position = CGPointMake(CGRectGetMidX(borderLayer.bounds), CGRectGetMidY(borderLayer.bounds));
    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@3, @3];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    [idCardView.layer addSublayer:borderLayer];
    [bgView addSubview:idCardView];
    
    lw = [MCToolsManage heightforString:@"添加车行展示图片" andHeight:20 fontSize:14];
     lx = (idCardView.mj_w - lw)/2;
    //    CGFloat ly = (bgview.mj_h - 20)/2;
    
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(lx, ly, lw, 20)];
    lbl.text = @"添加车行展示图片";
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textColor = [UIColor grayColor];
    [idCardView addSubview:lbl];
    addimgView =[[UIImageView alloc]initWithFrame:CGRectMake(lx - 5 - 20, ly, 20, 20)];
    addimgView.image =[UIImage imageNamed:@"card_add"];
    [idCardView addSubview:addimgView];
    
    _addIdCardF = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, idCardView.mj_w, idCardView.mj_h)];
    [idCardView addSubview:_addIdCardF];
    [_addIdCardF addTarget:self action:@selector(actionAddidcard:) forControlEvents:1<<6];
    
    
    
    y  = idCardView.mj_y + idCardView.mj_h + 5;
    h = 20;
    x = idCardView.mj_x;
    w = Main_Screen_Width -x;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"温馨提示:清晰可见的图片有助通过审核";
    lbl.font =[UIFont systemFontOfSize:13];
    lbl.textColor = AppCOLOR;
    [bgView addSubview:lbl];
    
    y += h + 30;
    h = 40;
    x =30;
    w = Main_Screen_Width - 2*x;
    
    UIButton * okBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y , w, h)];
    okBtn.backgroundColor = AppCOLOR;
    [okBtn setTitle:@"提交" forState:0];
    okBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [okBtn setTitleColor:[UIColor whiteColor] forState:0];
    ViewRadius(okBtn, 5);
    [okBtn addTarget:self action:@selector(actionOKBtn) forControlEvents:1<<6];
    [bgView addSubview:okBtn];
    
    

    
    
    
    
    
}
-(void)actionOKBtn{
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44 *5 +0.5 * 4;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"MerchantAutherTableViewCell";
    
    MerchantAutherTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[MerchantAutherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.viewController = self;
    cell.textArray = textArray;
    [cell prepareUI];
    [cell.seleAddBtn addTarget:self action:@selector(actionAddBtn) forControlEvents:1<<6];
    return cell;
    

    return [[UITableViewCell alloc]init];
}
-(void)actionAddBtn{
    
    MapSelectViewController * ctl =[[MapSelectViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField.tag == 200) {
        nameStr =textField.text;
    }
    else if (textField.tag == 201){
        addStr = textField.text;
    }
    else if (textField.tag == 202){
        ZnumStr =textField.text;

        
    }else if (textField.tag == 203){
        DnumStr =textField.text;

    }
    else if (textField.tag == 204){
        DQnumStr =textField.text;

    }
    
    [textArray removeAllObjects];
    [textArray addObject:nameStr?nameStr:@""];
    [textArray addObject:addStr?addStr:@""];
    [textArray addObject:ZnumStr?ZnumStr:@""];
    [textArray addObject:DnumStr?DnumStr:@""];
    [textArray addObject:DQnumStr?DQnumStr:@""];

    
}


-(void)actionAddidcard:(UIButton*)btn{
    
    if(btn == _addIdCardZ){
        _IdCardindex = 1;
    }
    else
    {
        _IdCardindex = 2;
        
    }
    
    
    HClActionSheet * actionSheet = [[HClActionSheet alloc] initWithTitle:@"请选择" style:HClSheetStyleDefault itemTitles:@[@"拍照",@"本地照片"]];
    actionSheet.delegate = self;
    actionSheet.tag = 200;
    actionSheet.itemTextColor = [UIColor blackColor];
    actionSheet.cancleTextColor = [UIColor redColor];//RGBCOLOR(36, 149, 221);
    actionSheet.cancleTitle = @"取消";
    __weak typeof(self) weakSelf = self;
    [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
        
        NSLog(@"block----%ld----%@", (long)index, title);
        if (index == 0) {//拍照
            [weakSelf PickerController];
        }
        else if(index == 1){
            
            
            [self btnClick];
            
            
        }
        
    }];
    
    
}
-(void)btnClick{
    
    
    
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 1;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            
            return duration >=1;
        } else {
            return YES;
        }
        
        
        
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

#pragma mark-拍照
-(void)PickerController{
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    sourceType=UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]){
        kAlertMessage(@"检测到无效的摄像头设备");
        return ;
    }
    
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    
    picker.delegate = self;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
    picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}
//图像选取器的委托方法，选完图片后回调该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image=[info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    //当图片不为空时显示图片并保存图片
    if (image != nil) {
        [self pickerimage:image];
        
    }
    
    
}
#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
    NSLog(@"%ld",assets.count);
    
    for (ALAsset *asset in assets) {
        UIImage*  tempImg =[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        [self pickerimage:tempImg];
        
    }
    
}


-(void)assetPickerControllerDidMaximum:(ZYQAssetPickerController *)picker{
    NSLog(@"到达上限");
}

-(void)pickerimage:(UIImage*)img{
    
    if (_IdCardindex == 1) {
        [_addIdCardZ setBackgroundImage:img forState:0];
        img1 = img;
    }
    else
    {
        [_addIdCardF setBackgroundImage:img forState:0];
        img2 = img;
        
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

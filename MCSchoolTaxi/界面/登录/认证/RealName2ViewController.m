//
//  RealName2ViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/3/5.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "RealName2ViewController.h"
#import "RealNameTableViewCell.h"
#import "ZYQAssetPickerController.h"

@interface RealName2ViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZYQAssetPickerControllerDelegate>
{
    UITableView * _tableView;
    UIImage * _caridImg1;
    UIImage * _caridImg2;
    UIImage * _caridImg3;
    UIImage * _caridImg4;

    NSInteger indexBtn;//1-4
}

@end

@implementation RealName2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
    self.view.backgroundColor = [UIColor whiteColor];
    [self prepreaUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepreaUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor =[UIColor whiteColor];
    [self prepareFooerView];
}
-(void)prepareFooerView{
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width;
    CGFloat h = 150;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _tableView.tableFooterView = view;
    
    y=30;
    h = 40;
    x = 35;
    w = Main_Screen_Width - 2*x;
    UIButton*  btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"完成" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    ViewRadius(btn, 5);
    btn.backgroundColor = AppCOLOR;
//    [btn addTarget:self action:@selector(actionnextBtn) forControlEvents:1<<6];
    [view addSubview:btn];
    
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1||section == 3) {
        return 40;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if (section == 1||section == 3) {

    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width , 40)];
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(30, 0, Main_Screen_Width - 60, 40)];
    lbl.text = @"温馨提示:没有驾照将不能租用电动汽车";
    if (section == 3) {
        lbl.text = @"温馨提示:清晰可见的图片有助于通过审核";

    }
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textColor = AppCOLOR;
    [view addSubview:lbl];
    return view;
    }
    return [[UIView alloc]init];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat x = 30;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = MCAdaptiveH(625, 253, w);

    return h;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"RealNameTableViewCell";
    
    RealNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[RealNameTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI3];
    cell.carIdBtn.tag = 200+indexPath.section;
    [cell.carIdBtn addTarget:self action:@selector(actionAddCaridBtn:) forControlEvents:1<<6];
    if (indexPath.section == 0) {
        cell.titelLbl.text = @"添加身份证正面图";
        if (_caridImg1) {
            [cell.carIdBtn setImage:_caridImg1 forState:0];
        }
        return cell;

    }

    else if (indexPath.section == 1){
        cell.titelLbl.text = @"添加学生证正面图";
        if (_caridImg2)
        [cell.carIdBtn setImage:_caridImg2 forState:0];
        return cell;

    }
    else if (indexPath.section == 2){
        cell.titelLbl.text = @"添加驾驶证正面图";
        if (_caridImg3)
        [cell.carIdBtn setImage:_caridImg3 forState:0];
        return cell;

    }
    else if (indexPath.section == 3){
        cell.titelLbl.text = @"添加行驶证正面图";
        if (_caridImg4)
        [cell.carIdBtn setImage:_caridImg4 forState:0];
        return cell;

    }
    return cell;
    

    
    return [[UITableViewCell alloc]init];
}
-(void)actionAddCaridBtn:(UIButton*)btn{
    indexBtn = btn.tag - 200 +1;
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
    
    if (indexBtn == 1) {
        _caridImg1 = img;
    }
    else if (indexBtn == 2)
    {
        _caridImg2 = img;
  
        
    }
    else if (indexBtn == 3)
    {
        _caridImg3 = img;
  
        
    } else if (indexBtn == 4)
    {
        
        _caridImg4 = img;
 
    }
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

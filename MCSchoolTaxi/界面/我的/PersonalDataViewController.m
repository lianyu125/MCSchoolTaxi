//
//  PersonalDataViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "PersonalDataViewController.h"
#import "PersonalDataTableViewCell.h"
#import "OwnerAuthenViewController.h"
#import "ZYQAssetPickerController.h"
#import "HClActionSheet.h"
#import "MyOwnerViewController.h"
@interface PersonalDataViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZYQAssetPickerControllerDelegate>
{
    
    UITableView *_tableView;
    NSArray * titleArray;
    NSArray * titlesudArray;
    UIImage * heardimg;
    BOOL isrenzheng;//是否认证
}

@end

@implementation PersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    titleArray = @[@"头像",@"姓名",@"手机号码",@"身份证号码",@"性别",@"学校",@"宿舍楼名称",@"车主认证"];
    titlesudArray = @[@"",@"michan",@"13400000000",@"99999999999999999",@"男",@"云南大学",@"南区宿舍楼",@"已认证"];
    isrenzheng = NO;
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return 44 + 16;
    }
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString * cellid = @"PersonalDataTableViewCell";
    
    PersonalDataTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[PersonalDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.accessoryType =UITableViewCellAccessoryNone;

    if (indexPath.row == 0) {
        [cell prepareUI1];
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        cell.titleLbl.text = @"头像";
        if (heardimg) {
            cell.heaerimgview.image = heardimg;
            return cell;

        }
        else
        {
            return cell;
  
        }
        return cell;

    }
    else
    {
        
        [cell prepareUI2];
        cell.titleLbl.text = titleArray[indexPath.row];
        cell.titleSubLbl.text = titlesudArray[indexPath.row];
        
        if (indexPath.row == 7) {
            cell.isrenzheng = isrenzheng;

            if (isrenzheng) {
                
                cell.accessoryType =UITableViewCellAccessoryNone;
                return cell;

            }
            else
            {
                cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;

                return cell;

            }
        }
        else
        {
            cell.accessoryType =UITableViewCellAccessoryNone;
            return cell;
        }
        
        
        
        
        
    }
    return cell;
    

    
    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        [self actionAddidcard];
    }
    
    
    if (indexPath.row == 7) {
        
        
        MyOwnerViewController * ctl = [[MyOwnerViewController alloc]init];
        ctl.indexView = 1;
        [self pushNewViewController:ctl];
    }
    
    
    
}
-(void)actionAddidcard{
    

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
    heardimg = img;
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

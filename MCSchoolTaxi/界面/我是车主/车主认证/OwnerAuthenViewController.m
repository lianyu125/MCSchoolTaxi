//
//  OwnerAuthenViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/24.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "OwnerAuthenViewController.h"
#import "ZYQAssetPickerController.h"

@interface OwnerAuthenViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZYQAssetPickerControllerDelegate,alertviewExtensionDelegate>
{
    AlertViewExtension *alert;

    UIButton * _addIdCardZ;
    UIButton * _addIdCardF;

    NSInteger _IdCardindex;//1为正 2为反
    UIImage *img1;
    UIImage *img2;

    
}

@end

@implementation OwnerAuthenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车主认证";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat x = 0;
    CGFloat  y = 64;
    CGFloat w = Main_Screen_Width;
    CGFloat h = 50 + 44;
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bgview];
    h = 50;
    y = 0;
    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"选择要共享出租的车辆";
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor = [UIColor grayColor];
    [bgview addSubview:lbl];
    
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(10, 49.5, bgview.mj_w - 20, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];
    y = 50;
    x = 0;
    w = 40;
    h = 40;
    CGFloat lw = Main_Screen_Width/3 - w;
    NSArray * titleArray = @[@"自行车",@"电动自行车",@"电动汽车"];
    for (NSInteger i =0; i <titleArray.count; i++) {
        UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [btn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
        [bgview addSubview:btn];
        if (i == 1) {
            btn.selected = YES;
        }
        btn.tag = 100+i;
        [btn addTarget: self action:@selector(actionBtn:) forControlEvents:1<<6];
        x+=w;
        UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, lw, h)];
        lbl.text =titleArray[i];
        lbl.adjustsFontSizeToFitWidth = YES;
        lbl.font =[UIFont systemFontOfSize:14];
        lbl.textColor = [UIColor darkTextColor];
        [bgview addSubview:lbl];
        x+=lw;
        
    }
    lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 50 + 43.5, bgview.mj_w , 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];

    
    
    y = bgview.mj_y + bgview.mj_h + 40;
    x = 30;
    w = Main_Screen_Width - x * 2;
    h = MCAdaptiveH(625, 253, w);
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
    [self.view addSubview:idCardView];
    lw = [MCToolsManage heightforString:@"添加身份证正面" andHeight:20 fontSize:14];
    
    CGFloat lx = (bgview.mj_w - lw)/2;
    CGFloat ly = (idCardView.mj_h - 20)/2;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(lx, ly, lw, 20)];
    lbl.text = @"添加身份证正面";
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
    [self.view addSubview:idCardView];
    
//    CGFloat lx = (bgview.mj_w - lw)/2;
//    CGFloat ly = (bgview.mj_h - 20)/2;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(lx, ly, lw, 20)];
    lbl.text = @"添加学生证正面";
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
    [self.view addSubview:lbl];

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
    [self.view addSubview:okBtn];
    
    

    
}
-(void)actionOKBtn{
    
    alert =[[AlertViewExtension alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    alert.delegate=self;
    [alert setbackviewframeWidth:300 Andheight:150];
    [alert settipeTitleStr:@"提示\n\n可选择提交或继续添加车辆" Andfont:14];
    alert.sureBtn.backgroundColor =[UIColor whiteColor];
    [alert.sureBtn setTitleColor:[UIColor grayColor] forState:0];
    [alert.cancelBtn setTitle:@"提交" forState:0];
    [alert.sureBtn setTitle:@"继续添加" forState:0];

    alert.cancelBtn.backgroundColor =[UIColor whiteColor];
    [alert.cancelBtn setTitleColor:[UIColor grayColor] forState:0];
    
    [self.view addSubview:alert];

    
    
    
}
-(void)clickBtnSelector:(UIButton *)btn
{
    [alert removeFromSuperview];

    if (btn.tag == 2000) {//提交
        
        
        
    }
    else
    {
        
        
        _IdCardindex = 0;
        [_addIdCardZ setBackgroundImage:nil forState:0];
        img1 = nil;
   
        [_addIdCardF setBackgroundImage:nil forState:0];
        img2 = nil;
        
        
    }
}

#pragma mark-选择车类型
-(void)actionBtn:(UIButton*)btn{
    for (NSInteger i = 100; i < 103; i++) {
        UIButton * btn2 = [self.view viewWithTag:i];
        btn2.selected = NO;
    }
    btn.selected = YES;
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

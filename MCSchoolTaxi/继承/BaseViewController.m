

#import "BaseViewController.h"
#import "UIViewController+HUD.h"
//#import "JPUSHService.h"

@interface BaseViewController ()
{

}

@end

@implementation BaseViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  //  self.navigationController.navigationBarHidden = YES;
    
}
- (void)pushNewViewController:(UIViewController *)newViewController {
    if (newViewController) {
    }
    [self.navigationController pushViewController:newViewController animated:YES];
}


-(void)stopshowLoading{
    [self hideHud];

    
}

- (void)showAllTextDialog:(NSString *)title
{
   [self showHint:title];
}
#pragma mark - Loading

- (void)showLoading
{
     [self showHudInView:self.view hint:nil];

}

- (void)showSuccess
{
    
}

- (void)showError
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AppMCBgCOLOR;
    _appColor = AppCOLOR;
    self.ReachabilityStatus = [MCDataMmodel sharedInstance].ReachabilityStatus;

    _requestManager = [MCNetworkManager instanceManager];
    
    UserModel * usermodel = [MCDataMmodel sharedInstance].userMdoel;
    _sessionId = usermodel.sessionId?usermodel.sessionId:@"";

    //    if (_instanceManager.isneedlogin) {
    if ([usermodel.sessionId length]){
        //    }
        NSDictionary * dic = @{
                               @"sessionId":usermodel.sessionId,
                               
                               };


[_requestManager configCommonHttpHeaders:dic];
    }
    
    if (IOS7) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self appColorNavigation];
   // [self ColorNavigation];
//    [[UINavigationBar appearance] setTintColor:_appColor];

   [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    //监听网络
[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(afNetworkStatusChanged) name:AFNetworkingReachabilityDidChangeNotification object:nil];
}
-(void)afNetworkStatusChanged{
   
    
    NSLog(@"afNetworkStatusChanged1");
    
    
}
-(void)appColorNavigation{
    
    UIColor * titleColor =[UIColor darkTextColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     titleColor, NSForegroundColorAttributeName,
                                                                     [UIFont fontWithName:@"CourierNewPSMT" size:20.0], NSFontAttributeName,
                                                                     nil]];
    self.navigationController.navigationBar.barTintColor =    AppMCNACOLOR;
    self.navigationController.navigationBar.tintColor = AppCOLOR;//RGBCOLOR(127, 125, 147);
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    
//    if (![self isKindOfClass:[MChomeViewController class] ]) {
//        [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
//
//    }
    
 
}
-(void)ColorNavigation{
    
    self.navigationController.navigationBar.barTintColor =       [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:RGBCOLOR(127, 125, 147)];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     RGBCOLOR(127, 125, 147), NSForegroundColorAttributeName,
                                                                     [UIFont fontWithName:@"CourierNewPSMT" size:20.0], NSFontAttributeName,
                                                                     nil]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)toPopVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark-推送

/*
-(void)prepareTuisong{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidSetup:)
                          name:kJPFNetworkDidSetupNotification
                        object:nil];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidClose:)
                          name:kJPFNetworkDidCloseNotification
                        object:nil];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidRegister:)
                          name:kJPFNetworkDidRegisterNotification
                        object:nil];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidLogin:)
                          name:kJPFNetworkDidLoginNotification
                        object:nil];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidReceiveMessage:)
                          name:kJPFNetworkDidReceiveMessageNotification
                        object:nil];
    [defaultCenter addObserver:self
                      selector:@selector(serviceError:)
                          name:kJPFServiceErrorNotification
                        object:nil];
 
    

}
- (void)networkDidSetup:(NSNotification *)notification {
    NSLog(@"已连接");

}

- (void)networkDidClose:(NSNotification *)notification {
    NSLog(@"未连接");
}

- (void)networkDidRegister:(NSNotification *)notification {
    NSLog(@"%@", [notification userInfo]);

    NSLog(@"已注册");
}

- (void)networkDidLogin:(NSNotification *)notification {

    NSLog(@"已登录");
    NSString * ss = [MCUserDefaults objectForKey:@"alias"];
    if (ss.length) {
        [JPUSHService setAlias:ss
              callbackSelector:@selector(tagsAliasCallback:tags:alias:)
                        object:self];
        
        
    }

    if ([JPUSHService registrationID]) {
        NSLog(@"get RegistrationID");
    }
}
*/
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSString *title = [userInfo valueForKey:@"title"];
    NSString *content = [userInfo valueForKey:@"content"];
    NSDictionary *extra = [userInfo valueForKey:@"extras"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *currentContent = [NSString
                                stringWithFormat:
                                @"收到自定义消息:%@\ntitle:%@\ncontent:%@\nextra:%@\n",
                                [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                               dateStyle:NSDateFormatterNoStyle
                                                               timeStyle:NSDateFormatterMediumStyle],
                                title, content, [self logDic:extra]];
    NSLog(@"%@", currentContent);
    
    
//    NSString *allContent = [NSString
//                            stringWithFormat:@"%@收到消息:\n%@\nextra:%@",
//                            [NSDateFormatter
//                             localizedStringFromDate:[NSDate date]
//                             dateStyle:NSDateFormatterNoStyle
//                             timeStyle:NSDateFormatterMediumStyle],
//                            [_messageContents componentsJoinedByString:nil],
//                            [self logDic:extra]];
//    
//    _messageContentView.text = allContent;
//    _messageCount++;
//    [self reloadMessageCountLabel];
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}

- (void)serviceError:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSString *error = [userInfo valueForKey:@"error"];
    NSLog(@"%@", error);
}
- (void)tagsAliasCallback:(int)iResCode
                     tags:(NSSet *)tags
                    alias:(NSString *)alias {
    
    
    NSLog(@"iResCode ===%zd",iResCode);
    NSLog(@"alias回调:%@", alias);
}


@end

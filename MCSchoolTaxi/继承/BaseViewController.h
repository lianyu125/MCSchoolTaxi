

#import <UIKit/UIKit.h>

@class MCNetworkManager;
@interface BaseViewController : UIViewController

@property(nonatomic,copy)NSString *sessionId;
@property (nonatomic,strong) MCNetworkManager *requestManager;
@property (nonatomic , strong)NSDictionary * classifyDic;
@property(nonatomic,assign)BOOL isshare;
@property (nonatomic , strong)UIColor * appColor;

-(void)ColorNavigation;
-(void)appColorNavigation;

/**
 *  push新的控制器到导航控制器
 *
 *  @param newViewController 目标新的控制器对象
 */
- (void)pushNewViewController:(UIViewController *)newViewController;

/**
 *  显示加载的loading，没有文字的
 */
- (void)showLoading;
///**
// *  显示带有某个文本加载的loading
// *
// *  @param text 目标文本
// */
//- (void)showLoading:(BOOL)show AndText:(NSString *)text;
//
- (void)showAllTextDialog:(NSString *)title;

///**
// *  显示成功的HUD
// */
//- (void)showSuccess;
///**
// *  显示错误的HUD
// */
//- (void)showError;
-(void)stopshowLoading;


-(id)analysis:(NSString*)str;
-(void)prepareTuisong;

-(void)updateClientId:(NSString*)RegistrationID;


-(void)jumpGogin;
- (void)toPopVC;
-(void)afNetworkStatusChanged;
@property(nonatomic,copy)NSString*ReachabilityStatus;




@end

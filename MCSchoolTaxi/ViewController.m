//
//  ViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/23.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)prepareUI{
    
    MainTableViewController * root = [[MainTableViewController alloc]init];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = root;

    
    return;
    if([MCUserDefaults objectForKey:@"UserDic"]){
        NSDictionary * dic =[MCUserDefaults objectForKey:@"UserDic"];
        NSLog(@"userDic ==%@",dic);
        UserModel * model = [UserModel mj_objectWithKeyValues:dic];
        if(model.sessionId.length){
            MCDataMmodel * datamodel = [MCDataMmodel sharedInstance];
            datamodel.userMdoel =model;
            
            
            MainTableViewController * root = [[MainTableViewController alloc]init];
            
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            appDelegate.window.rootViewController = root;
            
            return;
        }
        
    }
    
    
//    LogInViewController * root = [[LogInViewController alloc]init];
//    
//    MCNavViewController * nv = [[MCNavViewController alloc]initWithRootViewController:root];
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    appDelegate.window.rootViewController = nv;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

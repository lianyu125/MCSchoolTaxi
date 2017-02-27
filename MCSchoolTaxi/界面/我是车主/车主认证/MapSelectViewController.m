//
//  MapSelectViewController.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/24.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MapSelectViewController.h"
#import "MCMapView.h"

@interface MapSelectViewController ()
{
    
    MCMapView * _MapView;

    
    
}

@end

@implementation MapSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMapView];

    // Do any additional setup after loading the view.
}
-(void)addMapView{
    
    _MapView = [[MCMapView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64)];
    _MapView.ViewController = self;
    [self.view addSubview:_MapView];
    
    
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

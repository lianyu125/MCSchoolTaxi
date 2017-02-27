//
//  MerchantAutherTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/24.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantAutherViewController.h"
@interface MerchantAutherTableViewCell : UITableViewCell

@property(nonatomic,weak)BaseViewController * viewController;

-(void)prepareUI;
@property(nonatomic,strong)UIButton * seleAddBtn;

@property(nonatomic,strong)NSMutableArray * textArray;



@end

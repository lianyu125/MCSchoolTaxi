//
//  OrderDetailsViewController.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/27.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderDetailsViewController : BaseViewController

@property(nonatomic,assign)NSInteger stateIndex;//1 待抢单   2接单中  3进行中 4待付款
@property(nonatomic,assign)NSInteger typeIndex;//1 预约  2即时


@end

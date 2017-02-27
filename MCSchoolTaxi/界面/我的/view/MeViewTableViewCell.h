//
//  MeViewTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView * imgView;
@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UIView * hongView;

-(void)prepareUI;
@end

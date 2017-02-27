//
//  PersonalDataTableViewCell.h
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalDataTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView * heaerimgview;
@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UILabel * titleSubLbl;

@property(nonatomic,assign)BOOL  isrenzheng;//是否认证

-(void)prepareUI1;
-(void)prepareUI2;


@end

//
//  PersonalDataTableViewCell.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/25.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "PersonalDataTableViewCell.h"

@implementation PersonalDataTableViewCell
-(void)prepareUI1{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    _titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 44 + 16)];
    _titleLbl.textColor =[UIColor grayColor];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];
    
    _heaerimgview =[[UIImageView alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 - 20 - 5 - 44, 8, 44, 44)];
    ViewRadius(_heaerimgview, 44/2);
    _heaerimgview.image =[UIImage imageNamed:@"me_head"];
    [self.contentView addSubview:_heaerimgview];
    

    
    
    
    
}
-(void)prepareUI2{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    _titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 44)];
    _titleLbl.textColor =[UIColor grayColor];
    _titleLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];
    _titleSubLbl =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width - 10, 44)];
    _titleSubLbl.textColor =[UIColor grayColor];
    _titleSubLbl.font =[UIFont systemFontOfSize:14];
    _titleSubLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_titleSubLbl];
  
    
}
-(void)setIsrenzheng:(BOOL)isrenzheng
{
    
    
    if (isrenzheng) {
        _titleSubLbl.frame = CGRectMake(0, 0, Main_Screen_Width - 10, 44);
        
    }
    else
    {
        _titleSubLbl.frame = CGRectMake(0, 0, Main_Screen_Width - 10 - 20 - 5, 44);
 
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

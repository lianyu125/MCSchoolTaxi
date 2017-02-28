//
//  MCSeleAlertView.m
//  MCSchoolTaxi
//
//  Created by MC on 2017/2/28.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "MCSeleAlertView.h"
#import "CSItemSelectView.h"

@interface MCSeleAlertView ()<UIScrollViewDelegate,CSItemSelectViewDelegate>
{
    
    MCIucencyView *_bgView;
    UIButton * _OKBtn;
    CGFloat viewH;
    BOOL _isAnimate;
    UIView * _timeView;
    UIView * _dateView;
    UIButton * datebtn;
    UIButton * timeBtn;
    UIScrollView * mianScrollView;
    CSItemSelectView *timeselectView;
    CSItemSelectView *dateselectView;
    UILabel * priceLbl;
    
    
    NSInteger _dateindex;//1时间 2天
    NSInteger _timeindex;//

    


}
@property(nonatomic,strong)    UIView * seleView;

@end


@implementation MCSeleAlertView
-(void)actionBackBtn{
    if (_isAnimate) {
        _isAnimate = NO;
 
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.2 animations:^{
            weakSelf.seleView.frame = CGRectMake(0, Main_Screen_Height + viewH, Main_Screen_Width, viewH);

            [_bgView setBgViewAlpha:0];

        } completion:^(BOOL finished) {
            [_deldagate MCSeleAlertViewHidden];
        }];

    }
    else
    [_deldagate MCSeleAlertViewHidden];
}
-(void)actionBackBtn2{
    
}

-(instancetype)initWithFrame:(CGRect)frame MCstyle:(NSInteger)index{
    
    self = [super initWithFrame:frame];
    if (self) {
        _bgView = [[MCIucencyView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, frame.size.height)];
        [_bgView setBgViewColor:[UIColor blackColor]];
      
        
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionBackBtn)];
        [_bgView addGestureRecognizer:tap1];
        [_bgView setBgViewAlpha:.5];
        [self addSubview:_bgView];

        CGFloat x = 20;
        CGFloat w = Main_Screen_Width - 2*x;
        CGFloat h = 5 + 20 + 10 + 20 + 5 + 30 + 20 + 40;
        CGFloat y = (Main_Screen_Height-h)/2;
        UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        view1.backgroundColor =[UIColor whiteColor];
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionBackBtn2)];
        [view1 addGestureRecognizer:tap2];

        ViewRadius(view1, 5);
        [_bgView addSubview:view1];
        

        x = 0;
        y = 5;
        w =view1.mj_w;
        h = 20;
        UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.text = @"请选择租车类型";
        lbl.textColor =[UIColor darkTextColor];
        lbl.font =[UIFont systemFontOfSize:16];
        lbl.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:lbl];
        y +=h+10;
        w= view1.mj_w / 3;
        h = 20;
        x = 0;
        NSArray * array = @[@"自行车",@"电动自行车",@"电动汽车"];
        for (NSString * str  in array) {
            UILabel * lbl1 =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
            lbl1.text = str;
            lbl1.textColor =[UIColor darkTextColor];
            lbl1.font =[UIFont systemFontOfSize:14];
            lbl1.textAlignment = NSTextAlignmentCenter;
            [view1 addSubview:lbl1];
            x+=w;
        }
       
        
        y+=h +5;
        h =30;
        x = (w-h)/2;
        CGFloat offx = x;
        w = h;
        for (NSInteger i =0; i < 3; i++) {
            UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
            [btn setImage:[UIImage imageNamed:@"btn_chb"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"btn_chb_pre"] forState:UIControlStateSelected];
            [view1 addSubview:btn];
            btn.tag = 100+i;
            if (index == i) {
                btn.selected = YES;
            }
            [btn addTarget:self action:@selector(actionBtn:) forControlEvents:1<<6];
            x +=w +2*offx;

        }
        
        x = 0;
        y += h + 20;
        w = view1.mj_w;
        h = 40;
        
        UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, 1)];
        lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [view1 addSubview:lineView];

      _OKBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [_OKBtn setTitle:@"确定" forState:0];
        UIColor*c =AppCOLOR;
        [_OKBtn setTitleColor:c forState:0];
        _OKBtn.titleLabel.font =[UIFont systemFontOfSize:15];
        [_OKBtn addTarget:self action:@selector(actionOK) forControlEvents:1<<6];
        [view1 addSubview:_OKBtn];

        
    }
    return self;

}
-(void)actionOK{
    NSInteger index = 0;
    for (NSInteger i = 0; i<3; i++) {
        UIButton * btn1 = [self viewWithTag:i + 100];
        if (btn1.selected) {
            index = i;
            break;
        }
    
    }

    
    
    [_deldagate MCSeleAlertView:index];
    
    
}
-(void)actionBtn:(UIButton*)btn{
    
    for (NSInteger i = 0; i<3; i++) {
        UIButton * btn1 = [self viewWithTag:i + 100];
        btn1.selected = NO;
    }
    btn.selected = YES;
    
    
}
- (void)showInWindow{
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:self];
    
    
}
-(instancetype)initWithFrame:(CGRect)frame  MCDateTyle:(NSInteger)dateindex MCstyle:(NSInteger)index{
    self = [super initWithFrame:frame];
    if (self) {
        _isAnimate = YES;
//        if (dateindex !=1 &&dateindex !=2) {
//            dateindex = 1;
//        }
//        if (dateindex== 1) {
//            if (dateindex>23||dateindex < 1) {
//                index = 5;
//            }
//        }
//        if (dateindex == 2) {
//            if (dateindex>29||dateindex < 1) {
//                index = 5;
//            }
//
//        }
        _dateindex = dateindex;
        _timeindex =index;

        _bgView = [[MCIucencyView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, frame.size.height)];
        [_bgView setBgViewColor:[UIColor blackColor]];
        
        
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionBackBtn)];
        [_bgView addGestureRecognizer:tap1];
        
        [_bgView setBgViewAlpha:0];
        [self addSubview:_bgView];
        
        CGFloat w = Main_Screen_Width;
        CGFloat h = 40 + 1 + 20 +30 + 30 + 1*2 + 44 + 20 + 20 + 30;
        viewH = h;
        CGFloat x = 0;

        CGFloat y = Main_Screen_Height + h;
        _seleView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        _seleView.backgroundColor =[UIColor whiteColor];
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionBackBtn2)];
        [_seleView addGestureRecognizer:tap2];
        
        [_bgView addSubview:_seleView];
        
        x = 0;
        y = 0;
        w = 60;
        h = 40;
        UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [btn setTitle:@"取消" forState:0];
        [btn setTitleColor:[UIColor grayColor] forState:0];
        btn.titleLabel.font =[UIFont systemFontOfSize:14];
        [_seleView addSubview:btn];
        [btn addTarget:self action:@selector(actionBackBtn) forControlEvents:1<<6];
        x = Main_Screen_Width - w ;
        btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [btn setTitle:@"确认" forState:0];
        UIColor * cc = AppCOLOR;
        [btn addTarget:self action:@selector(actionSeleTimeOKBtn) forControlEvents:1<<6];

        [btn setTitleColor: cc forState:0];
        btn.titleLabel.font =[UIFont systemFontOfSize:14];
        [_seleView addSubview:btn];
        
        y = 40;
        h = 1;
        w= Main_Screen_Width;
        x = 0;
        UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [_seleView addSubview:lineView];

        y +=h + 20;
        h = 30;
        w = 60;
        x = Main_Screen_Width/2 - 10 - w;
        
         timeBtn=[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [timeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [timeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [timeBtn setTitle:@"按小时" forState:0];
        timeBtn.titleLabel.font =[UIFont systemFontOfSize:14];
        [timeBtn addTarget:self action:@selector(actionTimeBtn) forControlEvents:1<<6];
        if (dateindex ==1) {
        ViewBorderRadius(timeBtn, h/2, 1, [UIColor grayColor]);
            timeBtn.selected = YES;
   
        }
//        ViewBorderRadius(timeBtn, h/2, 1, [UIColor grayColor]);
        [_seleView addSubview:timeBtn];

        x  = Main_Screen_Width/2 +10;
        datebtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [datebtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [datebtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [datebtn setTitle:@"按天" forState:0];
        datebtn.titleLabel.font =[UIFont systemFontOfSize:14];
        [datebtn addTarget:self action:@selector(actiondatebtn) forControlEvents:1<<6];

        if (dateindex ==2) {
            ViewBorderRadius(datebtn, h/2, 1, [UIColor grayColor]);
            datebtn.selected = YES;
            
        }

        //        ViewBorderRadius(timeBtn, h/2, 1, [UIColor grayColor]);
        [_seleView addSubview:datebtn];

        y+= h + 30;
        x = 5;
        w = Main_Screen_Width - 2*5;
        h = 1;
        lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [_seleView addSubview:lineView];
        y+=h;
        h = 44;
        x = 0;
        w = Main_Screen_Width;
        mianScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        mianScrollView.contentSize = CGSizeMake(Main_Screen_Width * 2, 0);
        mianScrollView.pagingEnabled = YES;
        [_seleView addSubview:mianScrollView];

        _timeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 44)];
//        _timeView.backgroundColor =[UIColor redColor];
        [mianScrollView addSubview:_timeView];
        _dateView = [[UIView alloc]initWithFrame:CGRectMake(Main_Screen_Width, 0, Main_Screen_Width, 44)];
//        _dateView.backgroundColor =[UIColor orangeColor];
        [mianScrollView addSubview:_dateView];
        mianScrollView.showsVerticalScrollIndicator = NO;
        mianScrollView.showsHorizontalScrollIndicator = NO;
        mianScrollView.bounces = NO;
        mianScrollView.delegate = self;
       timeselectView = [CSItemSelectView itemSelectViewWithData:[self data] delegate:self selectViewWidth:60 defalutIndex:4];
        timeselectView.frame = CGRectMake(10, 0, Main_Screen_Width - 20, 44);
        timeselectView.selectTitleColor = AppCOLOR;//[UIColor greenColor];
        timeselectView.selectViewColor = [UIColor clearColor];
        timeselectView.normalTitleColor = [UIColor grayColor];
        timeselectView.titleFont = [UIFont systemFontOfSize:18.0];
        [_timeView addSubview:timeselectView];
        
        
        
        dateselectView = [CSItemSelectView itemSelectViewWithData:[self daydata] delegate:self selectViewWidth:60 defalutIndex:0];
        dateselectView.frame = CGRectMake(10, 0, Main_Screen_Width - 20, 44);
        dateselectView.selectTitleColor = AppCOLOR;//[UIColor greenColor];
        dateselectView.selectViewColor = [UIColor clearColor];
        dateselectView.normalTitleColor = [UIColor grayColor];
        dateselectView.titleFont = [UIFont systemFontOfSize:15.0];
        [_dateView addSubview:dateselectView];

        y+= h;
        x = 5;
        w = Main_Screen_Width - 2*5;
        h = 1;
        lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [_seleView addSubview:lineView];
        
        y +=h + 20;
        w = Main_Screen_Width/2;
        h = 20;
        x = 0;
        UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.text = @"预计租车价格";
        lbl.textColor = [UIColor grayColor];
        lbl.font =[UIFont systemFontOfSize:15];
        lbl.textAlignment =NSTextAlignmentRight;
        [_seleView addSubview:lbl];
        x = Main_Screen_Width/2+5;
        
        priceLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        priceLbl.text = @"10.00元";
        priceLbl.textColor = [UIColor orangeColor];
        priceLbl.font =[UIFont systemFontOfSize:15];
        [_seleView addSubview:priceLbl];

    }
    return self;

    
    
    
}
-(void)actionTimeBtn{
    _dateindex = 1;

    ViewBorderRadius(timeBtn, timeBtn.mj_h/2, 1, [UIColor grayColor]);
    timeBtn.selected = YES;
    
    
    ViewBorderRadius(datebtn, datebtn.mj_h/2, 0, [UIColor grayColor]);
    datebtn.selected = NO;
   mianScrollView.contentOffset = CGPointMake(0, 0);
    
    
}
-(void)actiondatebtn{
    _dateindex = 2;

    ViewBorderRadius(datebtn, datebtn.mj_h/2, 1, [UIColor grayColor]);
    datebtn.selected = YES;
    
    
    ViewBorderRadius(timeBtn, timeBtn.mj_h/2, 0, [UIColor grayColor]);
    timeBtn.selected = NO;
   mianScrollView.contentOffset = CGPointMake(Main_Screen_Width, 0);

    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offx =scrollView.contentOffset.x;

    if (scrollView == mianScrollView) {
        if (offx/Main_Screen_Width == 1) {
            _dateindex = 2;
            ViewBorderRadius(datebtn, datebtn.mj_h/2, 1, [UIColor grayColor]);
            datebtn.selected = YES;
            
            
            ViewBorderRadius(timeBtn, timeBtn.mj_h/2, 0, [UIColor grayColor]);
            timeBtn.selected = NO;

            
            
            
        }
        else
        {
            _dateindex = 1;

            ViewBorderRadius(timeBtn, timeBtn.mj_h/2, 1, [UIColor grayColor]);
            timeBtn.selected = YES;
            
            
            ViewBorderRadius(datebtn, datebtn.mj_h/2, 0, [UIColor grayColor]);
            datebtn.selected = NO;

            
        }
    }
    
    
}


//fake data
- (NSArray *)data
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 23; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d",i + 1];
        [array addObject:str];
    }
    return [array copy];
}
- (NSArray *)daydata
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 29; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d天",i + 1];
        [array addObject:str];
    }
    return [array copy];
}
-(void)actionSeleTimeOKBtn{
    if (_isAnimate) {
        _isAnimate = NO;
        
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.2 animations:^{
            weakSelf.seleView.frame = CGRectMake(0, Main_Screen_Height + viewH, Main_Screen_Width, viewH);
            
            [_bgView setBgViewAlpha:0];
            
        } completion:^(BOOL finished) {
//            [_deldagate MCSeleAlertViewHidden];
        }];
        
    }

    
    
    
    NSInteger seleindex = 0;
    NSString * str = @"";
    NSInteger  seleIndex = 0;
    if (_dateindex == 1) {//时间
        seleindex =  timeselectView.selectIndex;
        
        
    str =   [self data][seleindex];
        seleIndex =[str integerValue];
    }
    else//
    {
        seleindex =  dateselectView.selectIndex;
        str =   [self daydata][seleindex];
        NSMutableString * ss = [NSMutableString stringWithFormat:@"%@", str];
        if ([ss containsString:@"天"]) {
            [ss insertString:@"" atIndex:[ss length]-1];
 
        }
        seleIndex =[ss integerValue];


    }
    [_deldagate MCSeleAlertView:_dateindex Index:seleIndex];

    
    
    NSLog(@"str === %@",str);
    
    
    
}
#pragma mark - delegate
- (void)itemSelectView:(CSItemSelectView *)itemView didSelectItem:(NSString *)item atIndex:(NSInteger)index
{
    
    NSLog(@"item---%@,index --- %zd",item,index);

    if (itemView == timeselectView) {
       
        
        
    }
    else
    {
        
        
    }
    
    
    CGFloat offx =mianScrollView.contentOffset.x;

    if (offx/Main_Screen_Width == 1) {
        //天
        
    }
    else
    {
       
       
        
    }
    
}


- (void)showAnimateInWindow{
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:self];
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.seleView.frame = CGRectMake(0, Main_Screen_Height - viewH, Main_Screen_Width, viewH);
        
        
        [_bgView setBgViewAlpha:0.5];
    }];

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

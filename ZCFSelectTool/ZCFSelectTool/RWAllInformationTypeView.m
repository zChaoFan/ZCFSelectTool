//
//  RWAllInformationTypeView.m
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import "RWAllInformationTypeView.h"
#import "RWInformationBtn.h"
#import "RWInformationView.h"
#import "RWAllInformationTypeModel.h"


#define btnNum 4
#define btnImageNormalName @"home_ arrowDown"
#define btnImageSelectedName @"home_ arrowUp"
#define btnTitleColorNormal RGBColor(74, 74, 74)
#define btnTitleColorSelected RGBColor(9, 150, 255)

@interface RWAllInformationTypeView ()

@property (nonatomic ,strong) UIButton *selectedBtn;

@property (nonatomic ,strong) UIView *lineOne;

@property (nonatomic ,strong) RWInformationView  * informationView;

@property (nonatomic ,strong) RWAllInformationTypeModel *allInformationTypeModel;


@end

@implementation RWAllInformationTypeView

+ (instancetype)AllInformationTypeViewWithTypeArray:(NSArray *)typeArray AndFrame:(CGRect)frame{
    
    RWAllInformationTypeView *typeView = [[RWAllInformationTypeView alloc] initWithFrame:frame];
    typeView.typeNameArray = typeArray;
    
    for (int i = 0; i < btnNum; i++) {
        
        CGFloat btnW = typeView.bounds.size.width/btnNum;
        
        RWInformationBtn *btn = [[RWInformationBtn alloc] initWithFrame:CGRectMake(btnW*i, 0, btnW, 40)];
        [typeView addSubview:btn];
        btn.tag = i;
        [btn addTarget:typeView action:@selector(clickDidTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [typeView typeBtnSetThingsWith:btn];
        
    }
    
    typeView.lineOne = [[UIView alloc] initWithFrame:CGRectMake(0, 40-1,[UIScreen mainScreen].bounds.size.width, 1)];
    typeView.lineOne.backgroundColor = RGBColor(237, 242, 247);
    [typeView addSubview:typeView.lineOne];
    
    [typeView loadTypeData];

    return typeView;
}

- (void)loadTypeData{
    
    
    
   
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = RGBColor(255, 255, 255);
        
 
    }

    return self;
}




- (void)typeBtnSetThingsWith:(UIButton *)btn{
   
    
    if (self.typeNameArray.count == btnNum) {
        
        [btn setTitle:self.typeNameArray[btn.tag] forState:UIControlStateNormal];

    }else{
        if (btn.tag == 0) {
            [btn setTitle:@"类1" forState:UIControlStateNormal];
        }else if (btn.tag == 1){
            [btn setTitle:@"类2" forState:UIControlStateNormal];
        }else if (btn.tag == 2){
            [btn setTitle:@"类3" forState:UIControlStateNormal];
        }else if (btn.tag == 3){
            [btn setTitle:@"类4" forState:UIControlStateNormal];
        }
    }
    

    btn.titleLabel.font = kSystemFont(14);
    [btn setTitleColor:btnTitleColorNormal forState:UIControlStateNormal];
    [btn setTitleColor:btnTitleColorSelected forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:btnImageNormalName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:btnImageSelectedName] forState:UIControlStateSelected];
}

- (void)setAreaName:(NSString *)areaName{
    _areaName = areaName;
    UIButton *btn = self.subviews[3];
    [btn setTitle:areaName forState:UIControlStateNormal];
}

- (void)setTypeName:(NSString *)typeName{
    _typeName = typeName;
    UIButton *btn = self.subviews[0];
    [btn setTitle:typeName forState:UIControlStateNormal];

}

- (void)setTradeName:(NSString *)tradeName{
    _tradeName = tradeName;
    UIButton *btn = self.subviews[2];
    [btn setTitle:tradeName forState:UIControlStateNormal];
}

- (void)setResourcesName:(NSString *)resourcesName{
    _resourcesName = resourcesName;
    UIButton *btn = self.subviews[1];
    [btn setTitle:resourcesName forState:UIControlStateNormal];
}

#pragma mark - 点击事件

- (void)clickDidTypeBtn:(UIButton *)btn{
    
    if (btn.selected == YES) {
        btn.selected = NO;
    }else{
        self.selectedBtn.selected = NO;
        btn.selected = YES;
        self.selectedBtn = btn;
    }
    
    
    
    self.informationView.hidden = !btn.selected;
    __weakSelf
    self.informationView.clickCoverView = ^{
        
        [weakSelf AllInformationTypeViewBtnChangeNormal];
    };
    
    self.informationView.clickTableViewCell = ^(RWInformationTypeModel *model, RWInformationViewStyle informationViewStyle) {
        
        
        [weakSelf AllInformationTypeViewBtnChangeNormal];
        
        if (informationViewStyle == RWInformationViewStyleCity) {
           // weakSelf.areaId = model.id;
            weakSelf.areaName = model.name;
        }else if (informationViewStyle == RWInformationViewStyleTrade){
            //weakSelf.tradeId = model.id;
            weakSelf.tradeName = model.tradeName;
        }else if (informationViewStyle == RWInformationViewStyleResource){
            //weakSelf.resourcesType = model.id;
            weakSelf.resourcesName = model.name;
        }else{
            //weakSelf.type = model.id;
            weakSelf.typeName = model.name;
        }
    };

    
    switch (btn.tag) {
        case 0:
            self.informationView.informationViewStyle = RWInformationViewStyleNeed;
            self.informationView.informationTypeArray = self.allInformationTypeModel.needs;
            break;
        case 1:
            self.informationView.informationViewStyle = RWInformationViewStyleResource;
            self.informationView.informationTypeArray = self.allInformationTypeModel.resources;
            
            break;
        case 2:
            self.informationView.informationViewStyle = RWInformationViewStyleTrade;
            self.informationView.informationTypeArray = self.allInformationTypeModel.trades;
            break;
        case 3:
            self.informationView.informationViewStyle = RWInformationViewStyleCity;
            self.informationView.informationTypeArray = self.allInformationTypeModel.citys;
            break;
            
    }

//    if (self.clickSelectedBtn) {
//        self.clickSelectedBtn(btn);
//    }
    
}

- (void)AllInformationTypeViewBtnChangeNormal{
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            btn.selected = NO;
        }
    }
}

#pragma mark - 懒加载
- (RWInformationView *)informationView{
    
    if (!_informationView) {
        _informationView = [[RWInformationView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame) + 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
        [[UIApplication sharedApplication].keyWindow addSubview:_informationView];
        
        _informationView.hidden = YES;
    }
    
    return _informationView;
}

@end

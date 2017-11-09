//
//  RWAllInformationTypeView.h
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWAllInformationTypeView : UIView

@property (nonatomic ,copy) void (^clickSelectedBtn)(UIButton *btn);

@property (nonatomic ,copy) NSString *typeName;

@property (nonatomic ,copy) NSString *resourcesName;

@property (nonatomic ,copy) NSString *tradeName;

@property (nonatomic ,copy) NSString *areaName;

@property (nonatomic ,strong) NSArray  *typeNameArray;

+ (instancetype)AllInformationTypeViewWithTypeArray:(NSArray *)typeArray AndFrame:(CGRect)frame;
//按钮全部变为Normal状态
- (void)AllInformationTypeViewBtnChangeNormal;

@end

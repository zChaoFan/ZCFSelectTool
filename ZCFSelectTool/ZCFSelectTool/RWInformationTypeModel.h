//
//  RWInformationTypeModel.h
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWInformationTypeModel : NSObject<NSCoding>

#pragma mark - 通用
//类型ID
@property (nonatomic ,copy) NSString *id;

#pragma mark - 地区

@property (nonatomic ,copy) NSString *parentId;
//城市名称 & 类型名称
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *isHot;
@property (nonatomic ,copy) NSString *sequnce;

#pragma mark - 行业
//行业名称
@property (nonatomic ,copy) NSString *tradeName;


@property (nonatomic ,assign) BOOL isSelected;


@end

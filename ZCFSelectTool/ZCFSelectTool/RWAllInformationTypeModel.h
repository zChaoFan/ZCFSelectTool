//
//  RWAllInformationTypeModel.h
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWAllInformationTypeModel : NSObject<NSCoding>

@property (nonatomic ,strong) NSMutableArray *needs;

@property (nonatomic ,strong) NSMutableArray *citys;

@property (nonatomic ,strong) NSMutableArray *resources;

@property (nonatomic ,strong) NSMutableArray *trades;


@end

//
//  RWInformationView.h
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWInformationTypeModel.h"

typedef enum : NSUInteger {
    RWInformationViewStyleNeed,
    RWInformationViewStyleCity,
    RWInformationViewStyleResource,
    RWInformationViewStyleTrade,
} RWInformationViewStyle;

@interface RWInformationView : UIView

@property (nonatomic ,assign) RWInformationViewStyle informationViewStyle;


//

@property (nonatomic ,strong) NSMutableArray *informationTypeArray;

@property (nonatomic ,copy) void (^clickCoverView)();

@property (nonatomic ,copy) void (^clickTableViewCell)(RWInformationTypeModel *model,RWInformationViewStyle informationViewStyle);

@end

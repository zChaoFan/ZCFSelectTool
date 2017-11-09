//
//  RWInformationTypeCell.h
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/29.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWInformationTypeModel.h"
#import "RWInformationView.h"

//typedef enum : NSUInteger {
//    RWInformationCellStyleCity,
//    RWInformationCellStyleResource,
//    RWInformationCellStyleTrade,
//} RWInformationCellStyle;

@interface RWInformationTypeCell : UITableViewCell

@property (nonatomic ,assign) RWInformationViewStyle informationCellStyle;

@property (nonatomic ,strong) RWInformationTypeModel *informationTypeModel;

@end

//
//  RWAllInformationTypeModel.m
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import "RWAllInformationTypeModel.h"
#import "RWInformationTypeModel.h"

@implementation RWAllInformationTypeModel

+ (NSDictionary *)mj_objectClassInArray{

    return @{@"needs":[RWInformationTypeModel class],@"citys":[RWInformationTypeModel class],@"resources":[RWInformationTypeModel class],@"trades":[RWInformationTypeModel class]};
}



- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder  encodeObject:self.citys forKey:@"citys"];
    [encoder  encodeObject:self.resources forKey:@"resources"];
    [encoder  encodeObject:self.trades forKey:@"trades"];
    
}

- (instancetype)initWithCoder:(NSCoder *)decoder{

    if(self= [super  init]) {
        self.citys= [decoder  decodeObjectForKey:@"citys"];
        self.resources= [decoder  decodeObjectForKey:@"resources"];
        self.trades= [decoder  decodeObjectForKey:@"trades"];
    
    }
    
    return self;
  
}

@end

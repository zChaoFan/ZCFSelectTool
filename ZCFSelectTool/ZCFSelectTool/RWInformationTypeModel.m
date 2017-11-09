//
//  RWInformationTypeModel.m
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import "RWInformationTypeModel.h"

@implementation RWInformationTypeModel


- (void)encodeWithCoder:(NSCoder *)encoder{
    
    [encoder  encodeObject:self.id forKey:@"id"];
    [encoder  encodeObject:self.parentId forKey:@"parentId"];
    [encoder  encodeObject:self.name forKey:@"name"];
    [encoder  encodeObject:self.isHot forKey:@"isHot"];
    [encoder  encodeObject:self.sequnce forKey:@"sequnce"];
    [encoder  encodeObject:self.tradeName forKey:@"tradeName"];
    [encoder  encodeBool:self.isSelected forKey:@"isSelected"];
    
}

- (instancetype)initWithCoder:(NSCoder *)decoder{
    
    if(self= [super  init]) {
        
        self.id= [decoder  decodeObjectForKey:@"id"];
        self.parentId= [decoder  decodeObjectForKey:@"parentId"];
        self.name= [decoder  decodeObjectForKey:@"name"];
        self.isHot= [decoder  decodeObjectForKey:@"isHot"];
        self.sequnce= [decoder  decodeObjectForKey:@"sequnce"];
        self.tradeName= [decoder  decodeObjectForKey:@"tradeName"];
        self.isSelected= [decoder  decodeBoolForKey:@"isSelected"];
    }
    
    return self;
    
}

@end

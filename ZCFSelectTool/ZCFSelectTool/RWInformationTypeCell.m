//
//  RWInformationTypeCell.m
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/29.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import "RWInformationTypeCell.h"

@interface RWInformationTypeCell ()

@property (nonatomic ,strong) UILabel *titleLbl;

@property (nonatomic ,strong) UIView *lineOne;

@end

@implementation RWInformationTypeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = RGBColor(74, 74, 74);
        _titleLbl.font = kSystemFont(14);
        [self.contentView addSubview:_titleLbl];
        
        _lineOne = [[UIView alloc] init];
        _lineOne.backgroundColor = RGBColor(237, 242, 247);
        [self.contentView addSubview:_lineOne];
        
    }
    return self;
}

- (void)setInformationTypeModel:(RWInformationTypeModel *)informationTypeModel{
    
    _informationTypeModel = informationTypeModel;
    
    if (self.informationCellStyle == RWInformationViewStyleCity || self.informationCellStyle == RWInformationViewStyleResource || self.informationCellStyle == RWInformationViewStyleNeed) {
        _titleLbl.text = informationTypeModel.name;
    }else{
        _titleLbl.text = informationTypeModel.tradeName;
    }
    
    if (informationTypeModel.isSelected) {
        _titleLbl.textColor = RGBColor(9, 150, 255);
    }else{
        _titleLbl.textColor = RGBColor(74, 74, 74);
    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLbl sizeToFit];
    _titleLbl.mj_x = 28;
    _titleLbl.centerY = self.height*0.5;

    _lineOne.width = self.width;
    _lineOne.height = 0.5;
    _lineOne.mj_x = 0;
    _lineOne.mj_y = self.height - _lineOne.height;
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

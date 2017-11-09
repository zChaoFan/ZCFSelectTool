//
//  RWInformationView.m
//  RunwuProject
//
//  Created by runwu-Lu on 2017/9/28.
//  Copyright © 2017年 qiaowandong. All rights reserved.
//

#import "RWInformationView.h"
#import "RWInformationTypeCell.h"

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


@interface RWInformationView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) UIView *coverView;

@end

@implementation RWInformationView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGBACOLOR(0, 0, 0, 0.25);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clcikCoverView)];
        
        [self.coverView addGestureRecognizer:tap];
        
        [self addSubview:self.tableView];
        
       
    }

    return self;
}

- (void)setInformationTypeArray:(NSMutableArray *)informationTypeArray{
    _informationTypeArray = informationTypeArray;
    
    if (informationTypeArray.count * 42 > 406) {
        self.tableView.height = 406;
    }else{
        self.tableView.height = informationTypeArray.count * 42;
    }
    
    [self.tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.informationTypeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    RWInformationTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RWInformationTypeCell"];
    if (!cell) {
        cell = [[RWInformationTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RWInformationTypeCell"];
    }
    cell.informationCellStyle = self.informationViewStyle;
    cell.informationTypeModel = self.informationTypeArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 42;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    for (int i = 0; i < self.informationTypeArray.count; i++) {
        RWInformationTypeModel *model = self.informationTypeArray[i];
        if (indexPath.row == i) {
            model.isSelected = YES;
        }else{
            model.isSelected = NO;
        }
    }
    [tableView reloadData];

    if (self.clickTableViewCell) {
        self.clickTableViewCell(self.informationTypeArray[indexPath.row], self.informationViewStyle);
    }
    
    self.hidden = YES;
}

#pragma mark - 点击事件
- (void)clcikCoverView{

    self.hidden = YES;
    if (self.clickCoverView) {
        self.clickCoverView();
    }
}

#pragma mark - 懒加载
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 406) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.bounces = NO;
        _tableView.backgroundColor = RGBColor(237, 242, 247);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView *)coverView{
    
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.bounds];
        
        [self addSubview:_coverView];
    }
    return _coverView;
}

@end

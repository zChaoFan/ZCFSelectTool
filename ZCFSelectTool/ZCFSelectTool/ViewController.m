//
//  ViewController.m
//  ZCFSelectTool
//
//  Created by 张超凡 on 2017/11/9.
//  Copyright © 2017年 zcf. All rights reserved.
//

#import "ViewController.h"
#import "RWAllInformationTypeView.h"

@interface ViewController ()

@property (nonatomic ,strong) RWAllInformationTypeView  * informationTypeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = RGBColor(255, 255, 255);
    [self.view addSubview:self.informationTypeView];
}

- (RWAllInformationTypeView *)informationTypeView{
    
    if (!_informationTypeView) {
        
        _informationTypeView = [RWAllInformationTypeView AllInformationTypeViewWithTypeArray:@[@"全部",@"类型",@"行业",@"地区"] AndFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    }
    
    return _informationTypeView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

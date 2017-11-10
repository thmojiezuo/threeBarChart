//
//  ViewController.m
//  ThreeBarChart
//
//  Created by tenghu on 2017/11/8.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "ViewController.h"
#import "ThreeBarChart.h"
#import "UIColor+Extension.h"

@interface ViewController ()

@property (nonatomic ,strong)ThreeBarChart *barChart;
@property (nonatomic ,strong)UIScrollView *scroller;  //柱状图的

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self createHeaderChart];
    
}
#pragma mark - 创建 头部 柱状图
- (void)createHeaderChart{
    
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals3 = [[NSMutableArray alloc] init];
    
    NSArray *xLabels = @[@"微博",@"陌陌",@"加微",@"竞价",@"快手",@"电商",@"爱奇艺",@"百度加微",@"今日头条",@"美柚",@"万能Wifi"];
    
    NSArray *a1 = @[@"20",@"90",@"30",@"45",@"50",@"67",@"20",@"19",@"87",@"69",@"75"];
    NSArray *a2 = @[@"30",@"60",@"30",@"56",@"34",@"78",@"45",@"80",@"66",@"88",@"34"];
    NSArray *a3 = @[@"80",@"50",@"20",@"66",@"24",@"28",@"25",@"40",@"36",@"18",@"84"];
    [yVals1 addObjectsFromArray:a1];
    [yVals2 addObjectsFromArray:a2];
    [yVals3 addObjectsFromArray:a3];
    
    
    _scroller= [[UIScrollView alloc]initWithFrame:CGRectMake(70, 100,  [UIScreen mainScreen].bounds.size.width-70 , 345)];
    _scroller.showsHorizontalScrollIndicator = YES;
    _scroller.contentSize = CGSizeMake(xLabels.count*40+40, 0);
    _scroller.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:_scroller];

    
    _barChart = [[ThreeBarChart alloc]initWithFrame:CGRectMake(0, 0, xLabels.count*55, 160)];
    
    ThreeBarChartDataSet *set1 = [[ThreeBarChartDataSet alloc] initWithYValues:yVals1];
    [set1 setBarColor:[UIColor colorWithHexString:@"EE8C70"]];
    ThreeBarChartDataSet *set2 = [[ThreeBarChartDataSet alloc] initWithYValues:yVals2 ];
    [set2 setBarColor:[UIColor colorWithHexString:@"27A87A"]];
    ThreeBarChartDataSet *set3 = [[ThreeBarChartDataSet alloc] initWithYValues:yVals3 ];
    [set3 setBarColor:[UIColor colorWithHexString:@"D1A1E8"]];
    
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];
    [dataSets addObject:set2];
    [dataSets addObject:set3];
    
    ThreeBarChartData *data = [[ThreeBarChartData alloc] initWithDataSets:dataSets];
    data.xLabels = xLabels;
    data.itemSpace = 5;
    data.groupSpace = 57;
    data.yMaxNum = 90;
    data.totalNum = 601;
    _barChart.data = data;
    _barChart.displayAnimated = YES;
    _barChart.chartMargin = UIEdgeInsetsMake(40, 13.5, 40, 0); // 上左下右
    _barChart.showNumber = YES;
    
    [_scroller addSubview:_barChart];
    [_barChart show];
    
    _scroller.contentSize = CGSizeMake( xLabels.count*55+20, 0);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

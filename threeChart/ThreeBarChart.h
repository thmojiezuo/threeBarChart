//
//  ThreeBarChart.h
//  ThreeBarChart
//
//  Created by tenghu on 2017/11/9.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreeBarChartData.h"

@interface ThreeBarChart : UIView

// 中间图标区域(不包含坐标轴)的边距
@property (nonatomic, assign)UIEdgeInsets chartMargin;

@property (nonatomic, strong)ThreeBarChartData *data;

// 柱形顶部是否显示数值
@property (nonatomic, assign)BOOL showNumber;

// 是否显示Y轴
@property (nonatomic, assign)BOOL showYAxis;
@property (nonatomic, assign)BOOL showXAxis;

@property (nonatomic, assign)BOOL displayAnimated;

- (void)show;//显示柱状图


@end

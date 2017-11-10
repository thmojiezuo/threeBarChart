//
//  ThreeBarChartData.m
//  ThreeBarChart
//
//  Created by tenghu on 2017/11/9.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "ThreeBarChartData.h"

#define RGB(r,g,b)[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

@implementation ThreeBarChartData

- (instancetype)initWithDataSets:(NSArray<ThreeBarChartDataSet *> *)dataSets{
    self = [super init];
    if (!self) return nil;
    
    _dataSets = dataSets;
    _groupSpace = 20;
    _itemSpace = 1;
    _totalNum = 1;
    _yMaxNum = 0;
    
    for (ThreeBarChartDataSet *dataset in dataSets) {
        for (NSNumber *yValue in dataset.yValues) {
            if (yValue.floatValue > _yMaxNum) {
                _yMaxNum = yValue.floatValue;
            }
        }
    }
    
    return self;
}

- (BOOL)isGrouped{
    return _dataSets.count>1;
}
@end

@implementation ThreeBarChartDataSet

- (instancetype)initWithYValues:(NSArray<NSString *> *)yValues{
    
    if (self = [super init]){
        
        _yValues = yValues;
        _barColor = RGB(212, 149, 58);
        _BarbackGroudColor = [UIColor clearColor];
    }
    return self;
}

@end

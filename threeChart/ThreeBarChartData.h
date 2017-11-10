//
//  ThreeBarChartData.h
//  ThreeBarChart
//
//  Created by tenghu on 2017/11/9.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThreeBarChartDataSet;

@interface ThreeBarChartData : NSObject

@property (nonatomic, strong)NSArray<NSString *> *xLabels;
@property (nonatomic, strong)NSArray<NSString *> *yLabels;
@property (nonatomic, strong)NSArray<ThreeBarChartDataSet *> *dataSets;
@property (nonatomic)CGFloat yMaxNum;//y 轴最大值
@property (nonatomic,assign)NSInteger totalNum; //总和
@property (nonatomic, assign)CGFloat groupSpace;// 大的分组的间距
@property (nonatomic, assign)CGFloat itemSpace;// 单个组内的每个 item 间距


- (instancetype)initWithDataSets:(NSArray<ThreeBarChartDataSet *> *)dataSets;

@end

@interface ThreeBarChartDataSet : NSObject

@property (nonatomic, strong)NSArray<NSString *> *yValues;
@property (nonatomic, strong)UIColor *barColor;
@property (nonatomic, strong)UIColor *BarbackGroudColor;

- (instancetype)initWithYValues:(NSArray<NSString *> *)yValues ;

@end
NS_ASSUME_NONNULL_END

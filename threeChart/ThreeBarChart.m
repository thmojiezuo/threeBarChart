//
//  ThreeBarChart.m
//  ThreeBarChart
//
//  Created by tenghu on 2017/11/9.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "ThreeBarChart.h"
#import "ThreeChartBar.h"


@interface ThreeBarChart ()


@end

@implementation ThreeBarChart

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor = [UIColor clearColor];
        _showXAxis = YES;
        _showYAxis = YES;
        
    }
    return self;
}


-(void)show{
    
    [self setNeedsDisplay];
    
    CGFloat standardY = _data.yMaxNum;
    
    CGFloat barHeight = self.bounds.size.height - _chartMargin.top - _chartMargin.bottom;
    CGFloat barWidth = 5;
    
    ThreeBarChartDataSet *datasetx = _data.dataSets[0];
    NSInteger aa = datasetx.yValues.count;
    for (int i = 0; i < aa; i ++) {
        
        for (int j = 0; j < 3; j ++) {
            
            ThreeBarChartDataSet *dataset = _data.dataSets[j];
            
            CGFloat bar_x = _chartMargin.left + i*55 + j*(barWidth+_data.itemSpace);
            ThreeChartBar *bar = [[ThreeChartBar alloc]initWithFrame:CGRectMake(bar_x, _chartMargin.top, barWidth, barHeight)];
            
            NSString *yValue = dataset.yValues[i];
            if ([yValue floatValue] < 0.0 ||[yValue floatValue] == 0.0) {
                yValue = @"0";
            }
            
            bar.barProgress = yValue.floatValue/_data.yMaxNum;
            bar.tag = i*10+j+150;
            bar.barColor = dataset.barColor;
            bar.backgroundColor = dataset.BarbackGroudColor;
            
            if (j == 0) {
                ThreeBarChartDataSet *dataset1 = _data.dataSets[1];
                NSString *yValue1 = dataset1.yValues[i];
                if ([yValue1 floatValue] < 0.0 ||[yValue1 floatValue] == 0.0) {
                    yValue1 = @"0";
                }
                
                ThreeBarChartDataSet *dataset2 = _data.dataSets[2];
                NSString *yValue2 = dataset2.yValues[i];
                if ([yValue2 floatValue] < 0.0 ||[yValue2 floatValue] == 0.0) {
                    yValue2 = @"0";
                }
                
                if ([yValue1 floatValue] - [yValue floatValue] > 0.0) {
                    bar.layer.zPosition = 2;
                }
            }
            
            if (j == 1) {
                ThreeBarChartDataSet *dataset0 = _data.dataSets[0];
                NSString *yValue0 = dataset0.yValues[i];
                if ([yValue0 floatValue] < 0.0 ||[yValue0 floatValue] == 0.0) {
                    yValue0 = @"0";
                }
                
                ThreeBarChartDataSet *dataset2 = _data.dataSets[2];
                NSString *yValue2 = dataset2.yValues[i];
                if ([yValue2 floatValue] < 0.0 ||[yValue2 floatValue] == 0.0) {
                    yValue2 = @"0";
                }
                
                if (([yValue0 floatValue] - [yValue floatValue]) >= 0.0 && ([yValue0 floatValue] - [yValue floatValue])/standardY*80 < 9.0) {
                    bar.addInt = ([yValue0 floatValue] - [yValue floatValue])/standardY*80+9.0;
                    
                }
                
                if (([yValue floatValue] - [yValue0 floatValue])/standardY*80 >= 9.0) {
                    if ([yValue2 floatValue] - [yValue floatValue] >= 0.0 && ([yValue2 floatValue] - [yValue floatValue])/standardY*80 < 9.0) {
                        bar.addInt = 9.0- ([yValue2 floatValue] - [yValue floatValue])/standardY*80;
                    }
                }
                
                if (([yValue floatValue] - [yValue0 floatValue]) >= 0.0 && ([yValue floatValue] - [yValue0 floatValue])/standardY*80 < 9.0) {
                    bar.addInt = 9.0- ([yValue floatValue] - [yValue0 floatValue])/standardY*80;
                    
                }
            }
            
            if (j == 2) {
                ThreeBarChartDataSet *dataset0 = _data.dataSets[0];
                NSString *yValue0 = dataset0.yValues[i];
                if ([yValue0 floatValue] < 0.0 ||[yValue0 floatValue] == 0.0) {
                    yValue0 = @"0";
                }
                
                ThreeBarChartDataSet *dataset1 = _data.dataSets[1];
                NSString *yValue1 = dataset1.yValues[i];
                if ([yValue1 floatValue] < 0.0 ||[yValue1 floatValue] == 0.0) {
                    yValue1 = @"0";
                }
                
                if ([yValue floatValue] - [yValue1 floatValue] > 0.0 && [yValue0 floatValue] - [yValue1 floatValue] > 0.0) {
                    ThreeChartBar *bar0 = (ThreeChartBar *)[self viewWithTag:150+i*10+1];
                    bar0.layer.zPosition = 2;
                }
                
                if (([yValue1 floatValue] - [yValue0 floatValue])/standardY*80 >=9.0||([yValue0 floatValue] - [yValue floatValue])/standardY*80 >=9.0) {
                    if (([yValue1 floatValue] - [yValue floatValue]) >= 0.0 && ([yValue1 floatValue] - [yValue floatValue])/standardY*80 < 9.0) {
                        bar.addInt = 9.0- ([yValue1 floatValue] - [yValue floatValue])/standardY*80;
                    }
                }
                if (([yValue0 floatValue] - [yValue1 floatValue])/standardY*80 > 9.0 && ([yValue floatValue] - [yValue1 floatValue])/standardY*80 > 9.0) {
                    if (([yValue0 floatValue] - [yValue floatValue]) >= 0.0 && ([yValue0 floatValue] - [yValue floatValue])/standardY*80 < 9.0) {
                        bar.addInt = 9.0- ([yValue0 floatValue] - [yValue floatValue])/standardY*80;
                    }
                }
                if (([yValue1 floatValue] - [yValue0 floatValue])/standardY*80 > 9.0 && ([yValue1 floatValue] - [yValue floatValue])/standardY*80 > 9.0) {
                    if (([yValue0 floatValue] - [yValue floatValue]) >= 0.0 && ([yValue0 floatValue] - [yValue floatValue])/standardY*80 < 9.0) {
                        bar.addInt = 9.0- ([yValue0 floatValue] - [yValue floatValue])/standardY*80;
                    }
                }
                if (([yValue floatValue] - [yValue1 floatValue]) >= 0.0 && ([yValue floatValue] - [yValue1 floatValue])/standardY*80 < 9.0) {
                    if (([yValue0 floatValue] - [yValue1 floatValue]) >= 0.0 && ([yValue0 floatValue] - [yValue1 floatValue])/standardY*80 < 9.0) {
                        bar.addInt = ([yValue0 floatValue] - [yValue floatValue])/standardY*80+9.0+9.0;
                    }else{
                        bar.addInt = 9.0- ([yValue floatValue] - [yValue1 floatValue])/standardY*80+9.0;
                    }
                }
                if ((([yValue1 floatValue] - [yValue floatValue]) >= 0.0 && ([yValue1 floatValue] - [yValue floatValue])/standardY*80 < 9.0)&&[yValue floatValue] <= 0.0) {
                    bar.addInt = 18.0;
                }
                
            }
            
            if (_showNumber) {
                yValue = dataset.yValues[i];
                bar.barText = yValue;
            }
            
            bar.displayAnimated = _displayAnimated;
          
            [self addSubview:bar];
            
            
        }
    }
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 绘 X 轴数据
    if (_data.xLabels) {
        
        CGFloat xLabelWidth = 52;
        CGFloat xLabelHeight = 20;
        UIFont  *font = [UIFont systemFontOfSize:11];//设置
        
        ThreeBarChartDataSet *dataset = _data.dataSets[1];
        
        [dataset.yValues enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGRect rect = CGRectMake( idx*(xLabelWidth+3), self.bounds.size.height-35, xLabelWidth, xLabelHeight);
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(2, 2)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.path = maskPath.CGPath;
            maskLayer.fillColor = [UIColor colorWithWhite:1 alpha:0.3].CGColor;
            [self.layer addSublayer:maskLayer];
            
            NSString *string = @"";
            CGFloat pp = [obj floatValue] / _data.totalNum;
            NSString *st = [NSString stringWithFormat:@"%.1f%%",pp*100];
            if ([st containsString:@".0"]) {
                NSArray *arr = [st componentsSeparatedByString:@"."];
                string = [NSString stringWithFormat:@"%@%%",arr[0]];
            }else{
                string = st;
            }
            CGRect rect2 = CGRectMake( idx*(xLabelWidth+3), self.bounds.size.height-32, xLabelWidth, xLabelHeight);
            NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            style.lineBreakMode = NSLineBreakByWordWrapping;
            style.alignment = NSTextAlignmentCenter;
            [string drawWithRect:rect2 options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:style, NSForegroundColorAttributeName:[UIColor whiteColor]} context:nil];
            
        }];
        [_data.xLabels enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGRect rect = CGRectMake( idx*(xLabelWidth+3), self.bounds.size.height-15, xLabelWidth, xLabelHeight);
            NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            style.lineBreakMode = NSLineBreakByWordWrapping;
            style.alignment = NSTextAlignmentCenter;
            [obj drawWithRect:rect options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:style, NSForegroundColorAttributeName:[UIColor whiteColor]} context:nil];
            
        }];
    }
    
    // 绘 x/y 坐标轴
    
    if (_showXAxis) {
        
        CGContextSetLineWidth(context, 0.5);
        
        
        CGFloat heighty = 40;
        for (int i = 0; i < 3; i ++) {
            if (i == 0) {
                CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
            }else{
                CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:1 alpha:0.4].CGColor); //设置线的颜色为灰色
            }
            CGContextMoveToPoint(context, 0, (self.bounds.size.height-_chartMargin.bottom+2)-i*heighty); //设置线的起始点
            CGContextAddLineToPoint(context, self.bounds.size.width-_chartMargin.right, (self.bounds.size.height-_chartMargin.bottom+2)-i*heighty); //设置线中间的一个点
            CGContextStrokePath(context);//直接把所有的点连起来
        }
        
    }
    if (_showYAxis) {
        
        CGContextSetLineWidth(context, 2);
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:1 alpha:0.4].CGColor);
        CGFloat lengths[] = {0.5,5};
        CGContextSetLineDash(context, 0, lengths,2);
        CGContextMoveToPoint(context, 0, 0); //设置线的起始点
        CGContextAddLineToPoint(context, 0, self.bounds.size.height-_chartMargin.bottom+2); //设置线中间的一个点
        CGContextStrokePath(context);//直接把所有的点连起来
        
    }
    
}


@end

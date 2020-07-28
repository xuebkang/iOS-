//
//  RingView.m
//  CountDownForRing
//
//  Created by Kevin--Xue on 2020/7/28.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import "RingView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/** 宽度比 */
#define kScaleW kScreenWidth/375

/** 高度比 */
#define kScaleH kScreenHeight/667


@implementation RingView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path
     addArcWithCenter:CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5)
     radius:self.radius
     startAngle:2 * M_PI - M_PI_2
     endAngle:(2 * M_PI) * self.progress - M_PI_2
     clockwise:0];
    [path setLineWidth:4*kScaleW];
    [[UIColor orangeColor] set];
    [path stroke];
}


@end

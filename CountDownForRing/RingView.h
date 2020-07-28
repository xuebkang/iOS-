//
//  RingView.h
//  CountDownForRing
//
//  Created by Kevin--Xue on 2020/7/28.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RingView : UIView
@property(assign, nonatomic) CGFloat progress; // 白色部分比例 0~1
@property(assign, nonatomic) CGFloat radius;

@end

NS_ASSUME_NONNULL_END

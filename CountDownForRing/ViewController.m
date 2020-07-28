//
//  ViewController.m
//  CountDownForRing
//
//  Created by Kevin--Xue on 2020/7/28.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "RingView.h"
@interface ViewController ()

@property (nonatomic, strong) RingView *ringView;
@property (nonatomic, strong) NSTimer *progressTimer;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, assign) NSUInteger timeCount;

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _timeCount = 60;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupContents];
    [self setupProgressTimer];
}
- (void)setupContents {
  self.ringView = [[RingView alloc]initWithFrame:CGRectZero];
  self.ringView.backgroundColor = [UIColor clearColor];
  self.ringView.radius = 98.f;
  [self.ringView setNeedsLayout];
  
  self.timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  self.timeLabel.textColor = [UIColor blueColor];
  self.timeLabel.font = [UIFont boldSystemFontOfSize:24];
  self.timeLabel.backgroundColor = [UIColor clearColor];
  self.timeLabel.textAlignment = NSTextAlignmentCenter;
  
  [self.view addSubview:self.ringView];
  [self.ringView addSubview:self.timeLabel];
  
    self.ringView.frame = CGRectMake((self.view.frame.size.width -200)/2, (self.view.frame.size.height-200)/2, 200, 200);
    self.timeLabel.frame = CGRectMake((200-100)/2, (200-50)/2, 100, 50);
}

- (void)setupProgressTimer {
    __weak typeof(self) weakSelf = self;
    
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        weakSelf.timeCount--;
        weakSelf.timeLabel.text = [NSString stringWithFormat:@"%@s",@(self.timeCount)];
        weakSelf.ringView.progress = self.ringView.progress + 1 / 60.0;
        if (weakSelf.ringView.progress >= 1) {
           [timer invalidate];
           [weakSelf.ringView removeFromSuperview];
           [weakSelf.timeLabel removeFromSuperview];
           return;
         }
         [self.ringView setNeedsDisplay];
    }];
}
@end

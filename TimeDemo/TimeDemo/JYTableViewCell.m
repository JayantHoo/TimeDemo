//
//  JYTableViewCell.m
//  TimeDemo
//
//  Created by 翔梦01 on 2018/5/9.
//  Copyright © 2018年 JY.Hoo. All rights reserved.
//

#import "JYTableViewCell.h"
#import "JYTimerUtil.h"

@interface JYTableViewCell ()<JYTimerListener>

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation JYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //kvo监听time值改变（解决cell滚动时内容不及时刷新的问题）
    [self addObserver:self forKeyPath:@"time" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [[JYTimerUtil sharedInstance] addListener:self];
    
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"time"];
    [[JYTimerUtil sharedInstance] removeListener:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self onTimer];
}

-(void)didOnTimer:(JYTimerUtil *)timerUtil timeInterval:(NSTimeInterval)timeInterval
{
    [self onTimer];
}

-(void)onTimer
{
    NSTimeInterval lefTime = [[JYTimerUtil sharedInstance] lefTimeInterval:self.time];
    if (lefTime>0) {
        self.timeLabel.text = [NSString stringWithFormat:@"倒计时%d:%d:%d",(int)lefTime/60/60%60,(int)lefTime/60%60,(int)lefTime%60];
    }else {
        self.timeLabel.text = @"停止计时";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  JYTimerUtil.h
//  TimeDemo
//
//  Created by 翔梦01 on 2018/5/9.
//  Copyright © 2018年 JY.Hoo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JYTimerUtil;

@protocol JYTimerListener <NSObject>

-(void)didOnTimer:(JYTimerUtil *)timerUtil timeInterval:(NSTimeInterval) timeInterval;

@end

@interface JYTimerUtil : NSObject
+(instancetype)sharedInstance;

-(void)addListener:(id<JYTimerListener>) listener;

-(void)removeListener:(id<JYTimerListener>) listener;

-(void)timerPause;
-(void)timerStart;

-(void)resetServerTime;

-(NSTimeInterval)lefTimeInterval:(NSTimeInterval) time;

@end

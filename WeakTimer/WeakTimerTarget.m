//
//  WeakTimerTarget.m
//  WeakTimer
//
//  Created by BILLY HO on 12/22/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import "WeakTimerTarget.h"

@interface WeakTimerTarget ()

@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;

@end

@implementation WeakTimerTarget

- (instancetype)initWithTarget:(id)tar selector:(SEL)sel
{
	if (self = [super init])
	{
		_target = tar;
		_selector = sel;
	}
	return self;
}


- (void)timerDidFire:(NSTimer *)timer
{
	if(_target){
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		[_target performSelector:_selector withObject:nil];
#pragma clang diagnostic pop
		
	} else {
		[timer invalidate];
	}
}

- (void)dealloc
{
	NSLog(@"weak target dealloc");
}

@end

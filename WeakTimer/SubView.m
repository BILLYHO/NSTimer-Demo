//
//  SubView.m
//  WeakTimer
//
//  Created by BILLY HO on 12/22/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import "SubView.h"
#import "WeakTimerTarget.h"

@interface SubView ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *label;

@end


@implementation SubView

- (instancetype) initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		NSLog(@"SubView loaded");
		self.backgroundColor = [UIColor redColor];
		_label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * 0.2, 100, self.frame.size.width * 0.6, 100)];
		[_label setTextAlignment:NSTextAlignmentCenter];
		[self addSubview:_label];
		
		//retain cycle
		//timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(showTime) userInfo:nil repeats:YES];
		
		WeakTimerTarget *target = [[WeakTimerTarget alloc]initWithTarget:self selector:@selector(showTime)];
		_timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:target selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
	}
	return self;
}

- (void)showTime
{
	NSLog(@"hello");
	[_label setText:[NSString stringWithFormat:@"%@",[NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle]]];
}

- (void)dealloc
{
	NSLog(@"subview dealloc");
}
@end

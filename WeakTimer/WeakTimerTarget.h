//
//  WeakTimerTarget.h
//  WeakTimer
//
//  Created by BILLY HO on 12/22/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakTimerTarget : NSObject

- (instancetype)initWithTarget:(id)tar selector:(SEL)sel;
- (void)timerDidFire:(NSTimer *)timer;


@end

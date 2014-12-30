//
//  ViewController.m
//  WeakTimer
//
//  Created by BILLY HO on 12/22/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import "ViewController.h"
#import "SubView.h"

@interface ViewController ()

@property (nonatomic, strong) SubView *subview;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	NSLog(@"VC loaded.");
	[self.view setFrame: [[UIScreen mainScreen] bounds]];
	_subview = [[SubView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, 400)];
	[self.view addSubview:_subview];
	[self.view setBackgroundColor:[UIColor lightGrayColor]];
	
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.2, _subview.frame.origin.y + _subview.frame.size.height + 50, self.view.frame.size.width * 0.6, 50)];
	[button setTitle:@"stop" forState:UIControlStateNormal];
	[button addTarget:nil action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void)stop
{
	[_subview removeFromSuperview];
	_subview = nil;
	//[self.view addSubview:_subview];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

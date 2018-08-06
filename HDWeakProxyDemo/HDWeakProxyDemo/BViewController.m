//
//  BViewController.m
//  HDWeakProxyDemo
//
//  Created by jiamengqiang on 2018/8/6.
//  Copyright © 2018年 jiamengqiang. All rights reserved.
//

#import "BViewController.h"
#import "HDWeakProxy.h"

@interface BViewController () {
    NSTimer* _timer;
}

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _timer = [NSTimer timerWithTimeInterval:1 target:[HDWeakProxy weakProxyForObject:self] selector:@selector(update:) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}


-(void)update:(NSTimer* )timer {
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
    NSLog(@"%s",__func__);
}


@end

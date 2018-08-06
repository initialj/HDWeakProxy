//
//  HDWeakProxy.h
//  AwesomePageControl
//
//  Created by jiamengqiang on 2018/7/31.
//  Copyright © 2018年 jiamengqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 NSProxy本身是一个抽象类，它遵循NSObject协议，提供了消息转发的通用接口。NSProxy通常用来实现消息转发机制和惰性初始化资源。
 使用NSProxy，你需要写一个子类继承它，然后需要实现init以及消息转发的相关方法。
 */

@interface HDWeakProxy : NSProxy


+ (instancetype)weakProxyForObject:(id)target;

@end

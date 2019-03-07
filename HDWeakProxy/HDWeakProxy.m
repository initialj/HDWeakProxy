//
//  HDWeakProxy.m
//  AwesomePageControl
//
//  Created by jiamengqiang on 2018/7/31.
//  Copyright © 2018年 jiamengqiang. All rights reserved.
//

#import "HDWeakProxy.h"

@interface HDWeakProxy ()

@property (nonatomic,weak,readonly) id target;

@end

@implementation HDWeakProxy

#pragma mark - Life Cycle

- (instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+ (instancetype)weakProxyForObject:(id)target {
    HDWeakProxy* weakProxy = [HDWeakProxy alloc];
    return [weakProxy initWithTarget:target];
}

#pragma mark - Forwarding Messages

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [_target respondsToSelector:aSelector];
}


/**
 消息转发第二步，在第一步无法完成的情况下执行。这里只是把一个Selector简单的转发给另一个对象
 */
- (id)forwardingTargetForSelector:(SEL)selector
{
    // Keep it lightweight: access the ivar directly
    return _target;
}
/**
 当一个消息转发的动作NSInvocation到来的时候，在这里选择把消息转发给对应的实际处理对象
 消息转发第三步，在第二步也无法完成的情况下执行。将整个消息封装成NSInvocation，传递下去
 */
- (void)forwardInvocation:(NSInvocation *)invocation
{
    void *null = NULL;
    [invocation setReturnValue:&null];
}

/**
 当一个SEL到来的时候，在这里返回SEL对应的NSMethodSignature
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}


- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}


@end

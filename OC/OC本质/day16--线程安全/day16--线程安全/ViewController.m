//
//  ViewController.m
//  day16--线程安全
//
//  Created by Charlie on 2019/7/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "FYBaseDemo.h"
#import "lock/OSSPinLockDemo2.h"
#import "lock/FYOSUnfairLockDemo.h"
#import "lock/FYPthread_mutex.h"
#import "lock/FYPthread_mutex2.h"
#import "lock/FYPthread_Mutex3.h"
#import "lock/FYRecursiveLockDemo.h"

#import "lock/FYNSLock.h"
#import "lock/FYCondLockDemo.h"
#import "lock/FYCondLockDemo2.h"
#import "lock/FYSerialQueueDemo.h"
#import "lock/FYSemaphoreDemo.h"
#import "lock/FYSynchronizedDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	//FYPthread_mutex
	//
	FYBaseDemo *base = [[OSSPinLockDemo2 alloc]init];
	[base ticketTest];
	tickets = 1000000;
	[base ticketTest];
	tickets = 10000000;
	[base ticketTest];
}
//执行次数
NSInteger tickets = 10000;
//NSInteger tickets = 1000000;
//NSInteger tickets = 10000000;

bool isLog = false;
float sleepTime = .0f;
- (void)pthread{
	FYPthread_mutex *thr=[[FYPthread_mutex alloc]init];
	[thr ticketTest];
}
/*
 自旋锁 加锁
 一直处在busy-wait ，不一定忙等就不好，当等待时间很短，不用切换线程可以直接干活，性能也是好的，要是等待时间长，忙等恐怕不是很好的选择。
 */
- (void)testOSSpinLock{
	OSSPinLockDemo2 *base = [[OSSPinLockDemo2 alloc]init];
//	[base moneyTest];
	[base ticketTest];
}
//没加锁测试
- (void)base{
	FYBaseDemo *base = [[FYBaseDemo alloc]init];
	//    [base moneyTest];
	[base ticketTest];
}
- (void)osFairLock{
	FYOSUnfairLockDemo *base = [[FYOSUnfairLockDemo alloc]init];
//	[base moneyTest];
	[base ticketTest];
}
- (void)pthread_mutex{
	FYPthread_mutex *mutex=[FYPthread_mutex new];
	[mutex ticketTest];
}
- (void)pthread_mutex2{
	FYPthread_mutex2 *mutex=[FYPthread_mutex2 new];
	[mutex otherTest];
}
@end

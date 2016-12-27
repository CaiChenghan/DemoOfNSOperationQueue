//
//  SecondViewController.m
//  DemoOfNSOperationQueue
//
//  Created by 蔡成汉 on 2016/12/26.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  自定义队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //  最大并发数：当为1，则是串行队列；当大于1，则是并行队列。
    queue.maxConcurrentOperationCount = 1;
    
    //  创建一个NSOperation
    NSBlockOperation *op1 = [[NSBlockOperation alloc]init];
    op1.queuePriority = NSOperationQueuePriorityNormal;
    [op1 addExecutionBlock:^{
        sleep(1);
        NSLog(@"执行第1次操作，线程：%@", [NSThread currentThread]);
    }];
    
    //  添加到线程池中
    [queue addOperation:op1];
    
    NSBlockOperation *op2 = [[NSBlockOperation alloc]init];
    op2.queuePriority = NSOperationQueuePriorityVeryLow;
    [op2 addExecutionBlock:^{
        sleep(1);
        NSLog(@"执行第2次操作，线程：%@", [NSThread currentThread]);
    }];
    [queue addOperation:op2];
    
    NSBlockOperation *op3 = [[NSBlockOperation alloc]init];
    op3.queuePriority = NSOperationQueuePriorityHigh;
    [op3 addExecutionBlock:^{
        sleep(1);
        NSLog(@"执行第3次操作，线程：%@", [NSThread currentThread]);
    }];
    [queue addOperation:op3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

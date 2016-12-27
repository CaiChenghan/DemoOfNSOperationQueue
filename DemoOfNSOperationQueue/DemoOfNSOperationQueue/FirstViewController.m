//
//  FirstViewController.m
//  DemoOfNSOperationQueue
//
//  Created by 蔡成汉 on 2016/12/26.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  获取主队列：同步串行
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    //  创建一个NSOperation
    NSBlockOperation *op1 = [[NSBlockOperation alloc]init];
    [op1 addExecutionBlock:^{
        sleep(1);
        NSLog(@"执行第1次操作，线程：%@", [NSThread currentThread]);
    }];
    
    //  添加到线程池中
    [mainQueue addOperation:op1];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(1);
        NSLog(@"执行第2次操作，线程：%@", [NSThread currentThread]);
    }];
    [mainQueue addOperation:op2];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(1);
        NSLog(@"执行第3次操作，线程：%@", [NSThread currentThread]);
    }];
    [mainQueue addOperation:op3];
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

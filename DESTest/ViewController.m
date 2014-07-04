//
//  ViewController.m
//  DESTest
//
//  Created by 余河川 on 14-6-30.
//  Copyright (c) 2014年 余河川. All rights reserved.
//

#import "ViewController.h"
#import "SLYDESCryptor.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * key = @"sxit!@#$";
//    NSData * data = [@"success" dataUsingEncoding:NSUTF8StringEncoding];
    NSData * data = [[NSData alloc] initWithBase64EncodedString:@"wZGyoICf5fo=" options:0];
    SLYDESCryptor * decry = [[SLYDESCryptor alloc] initToDecryptInputData:data keyData:[key dataUsingEncoding:NSUTF8StringEncoding]];
    [decry setCompletionHandle:^(NSData *outputData, NSError *error) {
        //        NSLog(@"%@", [outputData base64EncodedStringWithOptions:0]);
        NSLog(@"%@", [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding]);
    }];
    [decry start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

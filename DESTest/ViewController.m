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
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 320, 50)];
    [self.view addSubview:label];
//    NSData * data = [@"success" dataUsingEncoding:NSUTF8StringEncoding];
    NSData * data = [[NSData alloc] initWithBase64EncodedString:@"wZGyoICf5fo=" options:0];
    SLYDESCryptor * decry = [[SLYDESCryptor alloc] initToDecryptInputData:data keyData:[key dataUsingEncoding:NSUTF8StringEncoding]];
    [decry setCompletionHandle:^(NSData *outputData, NSError *error) {
        //        NSLog(@"%@", [outputData base64EncodedStringWithOptions:0]);
        NSString * outputStr = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
        [label setText:outputStr];
        NSLog(@"%@", [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding]);
    }];
    [[NSOperationQueue new] addOperation:decry];
    NSLog(@"%@", [NSOperationQueue mainQueue] == [NSOperationQueue currentQueue] ? @"yes": @"no");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

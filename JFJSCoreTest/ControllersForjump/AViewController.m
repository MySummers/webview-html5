//
//  AViewController.m
//  JFJSCoreTest
//
//  Created by Jeffrey on 17/1/9.
//  Copyright © 2017年 Jeffrey. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"A";
    self.view.backgroundColor = [UIColor grayColor];
    NSLog(@"属性分别是prodId:%@,prodName:%@,prodPrice:%@", self.prodId, self.prodName, self.prodPrice);
    // Do any additional setup after loading the view.
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

//
//  BViewController.m
//  JFJSCoreTest
//
//  Created by Jeffrey on 17/1/9.
//  Copyright © 2017年 Jeffrey. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"B";
    self.view.backgroundColor = [UIColor grayColor];
    NSLog(@"属性分别是petId:%@,petName:%@,petPrice:%@", self.petId, self.petName, self.petPrice);

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

//
//  ViewController.m
//  JFJSCoreTest
//
//  Created by Jeffrey on 17/1/9.
//  Copyright (c) 2017 Jeffrey. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <objc/Runtime.h>

@interface ViewController () <UIWebViewDelegate>
@property(nonatomic, weak) IBOutlet UIWebView *webView;
@property(nonatomic, weak) JSContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webViewConfig];
    // Do any additional setup after loading the view, typically from a nib.
}

/**设置本地网页，并读取之*/
- (void)webViewConfig {
    self.title = @"初始网页";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jstest" ofType:@"html"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

/**设置JS环境，这里需要在网页读取之后*/
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    /**获取全局的js环境*/
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    /**描述html里的方法jumpToController如何执行*/
    self.context[@"jumpToController"] = ^{
        /**args为获取这个方法传过来的参数，得到的是JSValue对象,和后台协商好，传过来就只有一个字符串和一个字典，字符串放控制器名称，字典的key和value对应属性名和其值*/
        NSArray *args = [JSContext currentArguments];
        Class controllerClass = nil;
        NSDictionary *parameters = nil;
        /**遍历从js传过来的值，这里只有两个，一个字符串一个字典，字符串为类名，字典为需要的属性*/
        for (JSValue *jsVal in args) {
            /**传过来的值是字符串，说明是控制器名字*/
            if ([jsVal isString]) {
                NSString *controllerName = [jsVal toString];
                controllerClass = NSClassFromString(controllerName);
            }
            /**传过来的值是对象，说明存的是参数,那么使用字典接收*/
            if ([jsVal isObject]) {
                parameters = [jsVal toDictionary];
            }
        }
        /**拿到类名和属性，直接生成控制器赋值(务必保证传过来的字符串是正确的控制器类名）*/
        UIViewController *viewController = (UIViewController *) [[controllerClass alloc] init];//既然已经是传的正确的控制器名，那么这里一定可以强转成功。
        /**给控制器赋值*/
        [viewController setValuesForKeysWithDictionary:parameters];
        /**页面跳转*/
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:viewController animated:YES];
        });
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
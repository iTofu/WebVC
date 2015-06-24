//
//  WebVC.m
//  WebVCDemo
//
//  Created by 刘超 on 15/6/24.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

#import "WebVC.h"

@interface WebVC () <UIWebViewDelegate>

@end

@implementation WebVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    self.URLString = @"http://zdl.mbox.duowan.com/phone/playerDetailNew.php?sn=%E7%BD%91%E9%80%9A%E5%9B%9B&target=%E5%B2%82%E5%81%95%E8%80%81%E4%B9%8B%E5%8F%AF%E6%9C%9F&v=101&OSType=iOS9.0&versionName=2.2.4";
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.URLString]]];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    BOOL headerIsPresent = [[request allHTTPHeaderFields] objectForKey:@"Dw-Ua"] != nil;
    
    if (headerIsPresent) return YES;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSURL *url = [request URL];
            
            NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
                                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                               timeoutInterval:16.0f];
            
            [request addValue:@"lolbox&2.2.4-101&ios9.0&App Store" forHTTPHeaderField:@"Dw-Ua"];
            
            [webView loadRequest:request];
        });
    });
    
    return NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end

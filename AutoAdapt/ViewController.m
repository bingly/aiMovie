//
//  ViewController.m
//  AutoAdapt
//
//  Created by xmli2 on 15/9/10.
//  Copyright (c) 2015年 iflytek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnBack;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)backWebPage:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://61.132.255.99/h"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
    _webview.scalesPageToFit = NO;
    _webview.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backWebPage:(id)sender{
    if (_webview.canGoBack) {
        [_webview goBack];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    _webview.hidden = true;
    [_activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    _activityIndicator.hidden = true;
    _webview.hidden = false;
}

@end

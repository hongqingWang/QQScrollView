//
//  QQHomeWebViewController.m
//  QQScrollView
//
//  Created by Mac on 06/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQHomeWebViewController.h"
#import <WebKit/WebKit.h>

static NSString *const progressKeyPath = @"estimatedProgress";

@interface QQHomeWebViewController ()<WKNavigationDelegate>

/// WebView
@property (nonatomic, strong) WKWebView *webView;
/// ProgressView
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation QQHomeWebViewController

#pragma mark - Left Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

// 记得取消监听
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:progressKeyPath];
}

#pragma mark - Load Data
- (void)loadData {

//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
}

#pragma mark - WKNavigationDelegate
// 如果不添加这个，那么wkwebview跳转不了AppStore
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if ([webView.URL.absoluteString hasPrefix:@"https://itunes.apple.com"]) {
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
    }else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

#pragma mark - Event Response
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:progressKeyPath]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.progressView.alpha = 1.0f;
        [self.progressView setProgress:newprogress animated:YES];
        if (newprogress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 self.progressView.alpha = 0.0f;
                             }
                             completion:^(BOOL finished) {
                                 [self.progressView setProgress:0 animated:NO];
                             }];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Getters and Setters
- (WKWebView *)webView {
    if (_webView == nil) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
//        _webView.opaque = NO;
//        _webView.multipleTouchEnabled = YES;
        [_webView addObserver:self forKeyPath:progressKeyPath options:NSKeyValueObservingOptionNew context:nil];
    }
    return _webView;
}

- (UIProgressView *)progressView {
    if (_progressView == nil) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 0)];
        _progressView.tintColor = [UIColor greenColor];
        _progressView.trackTintColor = [UIColor whiteColor];
    }
    
    return _progressView;
}

@end

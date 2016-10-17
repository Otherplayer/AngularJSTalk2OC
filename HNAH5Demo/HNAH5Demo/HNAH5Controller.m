//
//   /\_/\
//   \_ _/
//    / \ not
//    \_/
//
//  Created by __无邪_ on 2016/10/17.
//  Copyright © 2016年 __无邪_. All rights reserved.
//

#import "HNAH5Controller.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"
#import "TransportJSObject.h"


#define IS_OFFLINE_TEST 1
#define JSObjectIdentifier @"JSObjectBridge"
#define JSContextKey @"documentView.webView.mainFrame.javaScriptContext"
#define kMainWidth [[UIScreen mainScreen] bounds].size.width
#define kMainHeight [[UIScreen mainScreen] bounds].size.height

@interface HNAH5Controller ()<NJKWebViewProgressDelegate,UIWebViewDelegate>{
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
}
@property (nonatomic, strong)NJKWebViewProgress *progressProxy;
@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)JSContext *context;
@property (nonatomic, strong)TransportJSObject *jsTransport;
@end

@implementation HNAH5Controller

#pragma mark - LifeCircle

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
    [self loadGoogle];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:_progressView];
    //[self.navigationController.navigationBar addSubview:_progressView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    // 初始化View
    CGFloat progressBarHeight = 2.5f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, 64, navigationBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_progressView];
    _progressProxy = [[NJKWebViewProgress alloc] init];
    self.webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
}

#pragma mark - Network Methods

#pragma mark - Action

- (void)loadGoogle{

    self.urlStr = [self checkUrl:self.urlStr];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlStr]];
    //清除UIWebView的缓存
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:req];
    [self.webView loadRequest:req];
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    self.context = [self.webView valueForKeyPath:JSContextKey];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}


#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress{
    [_progressView setProgress:progress animated:YES];
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if (!self.jsTransport) {
        self.jsTransport=[TransportJSObject new];
    }
    self.context[JSObjectIdentifier]=self.jsTransport;
    
    [self configureBlockAction];
    
    self.context = [self.webView valueForKeyPath:JSContextKey]; // Undocumented access to UIWebView's JSContext
    self.context[@"ios"] = self;
    
    #ifdef IS_OFFLINE_TEST
        JSContext *ctx = [webView valueForKeyPath:JSContextKey];
        ctx[@"window"][@"alert"] = ^(JSValue *message) {
            NSLog(@"===============%@",[message toString]);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JavaScript Alert" message:[message toString] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        };
    #endif
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
- (void)configureBlockAction{
    [self.jsTransport setDidClickCancelBlock:^{
        
    }];
    [self.jsTransport setDidClickSubmitBlock:^(NSDictionary *parameters) {
        NSLog(@"%@",parameters);
    }];
}
#pragma mark - Private

- (NSString *)checkUrl:(NSString *)url{
    if ([url hasPrefix:@"www"]) {
        url = [NSString stringWithFormat:@"http://%@",self.urlStr];
    }
    return url;
}

#pragma mark - Configure

- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, kMainWidth, kMainHeight - 64)];
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}


@end

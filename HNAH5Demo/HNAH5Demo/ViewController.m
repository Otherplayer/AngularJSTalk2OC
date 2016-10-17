//
//  ViewController.m
//  HNAH5Demo
//
//  Created by __无邪_ on 2016/10/13.
//  Copyright © 2016年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "TransportJSObject.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    
    
//    NSString *urlString = @"http://10.71.173.33:8080/bimbot-h5/src/app/components/businesstrip/business-trip.html";
//    NSURL *httpUrl = [NSURL URLWithString:urlString];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"business-vetting" ofType:@"html"];
    NSURL* httpUrl = [NSURL fileURLWithPath:path];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:httpUrl];
    [self.webView loadRequest:request];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendMessage:(id)sender {
    NSLog(@"--");
}

#pragma mark - UIWebViewDelegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //网页加载之前会调用此方法
    
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    //开始加载网页调用此方法
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //网页加载失败 调用此方法
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //网页加载完成调用此方法
    
    
    
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 JSObject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
    
    
    
    context[@"JSObject"] = ^() {
        NSArray *args = [JSContext currentArguments];
        NSLog(@"Parameters");
        __block NSString *paramStr = @"";
        [args enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@",obj);
            paramStr = [paramStr stringByAppendingFormat:@"参数%ld：%@\n",(long)idx,obj];
        }];
    };
    
    
    TransportJSObject *testJO=[TransportJSObject new];
    context[@"JSObject"]=testJO;
}


#pragma mark - 

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}


@end

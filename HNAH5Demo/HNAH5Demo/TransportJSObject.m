//
//  TransportJSObject.m
//  HNAH5Demo
//
//  Created by __无邪_ on 2016/10/13.
//  Copyright © 2016年 __无邪_. All rights reserved.
//

#import "TransportJSObject.h"
#import "NSString+Categories.h"

@implementation TransportJSObject
//一下方法都是只是打了个log 等会看log 以及参数能对上就说明js调用了此处的iOS 原生方法
-(void)jsCancel
{
    NSLog(@"this is ios jsCancel");
    if (self.didClickCancelBlock) {
        self.didClickCancelBlock();
    }
}
-(void)jsSubmit:(NSString *)message
{
    NSLog(@"this is ios jsSubmit=%@",message);
    if (self.didClickSubmitBlock) {
        self.didClickSubmitBlock([message jsonInfo]);
    }
}
@end

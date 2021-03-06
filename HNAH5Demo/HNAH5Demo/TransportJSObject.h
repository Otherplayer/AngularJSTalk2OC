//
//  TransportJSObject.h
//  HNAH5Demo
//
//  Created by __无邪_ on 2016/10/13.
//  Copyright © 2016年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

//首先创建一个实现了JSExport协议的协议
@protocol TransportJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)jsCancel;
-(void)jsSubmit:(NSString *)message;

@end


@interface TransportJSObject : NSObject<TransportJSObjectProtocol>

@property (nonatomic, copy) void(^didClickCancelBlock)();
@property (nonatomic, copy) void(^didClickSubmitBlock)(NSDictionary *info);

@end

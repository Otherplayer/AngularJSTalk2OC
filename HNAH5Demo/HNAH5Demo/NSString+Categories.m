//
//  NSString+Categories.m
//  HNAH5Demo
//
//  Created by __无邪_ on 2016/10/17.
//  Copyright © 2016年 __无邪_. All rights reserved.
//

#import "NSString+Categories.h"

@implementation NSString (Categories)
- (NSDictionary *)jsonInfo{
    NSError *error = nil;
    NSData *data;
    if([self dataUsingEncoding:NSASCIIStringEncoding])
    {
        data = [self dataUsingEncoding:NSASCIIStringEncoding];
    }else{
        data = [self dataUsingEncoding:NSUTF8StringEncoding];
    }
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingAllowFragments
                                                                 error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }
    return nil;
}
@end

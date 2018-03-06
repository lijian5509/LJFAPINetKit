//
//  CWAPIUnitTest.m
//  carwins.business.ZongBu.UAT
//
//  Created by Lone on 2018/3/6.
//  Copyright © 2018年 CarWins Inc. All rights reserved.
//

#import "CWAPIUnitTest.h"
#import "AFNetworking.h"

@implementation CWAPIUnitTest

//请求管理器
+ (AFHTTPSessionManager *)sessionManager
{

    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [AFHTTPSessionManager manager];
        manager.operationQueue.maxConcurrentOperationCount = 5;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                             @"application/json",
                                                             @"text/xml",
                                                             @"text/html",
                                                             nil];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval=30.f;
    });
#pragma mark - 支持https
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    return manager;
}

@end

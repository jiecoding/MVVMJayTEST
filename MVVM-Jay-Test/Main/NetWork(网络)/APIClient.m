//
//  APIClient.m
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "APIClient.h"
#import "NetTool.h"
#import "Urls.h"
@implementation APIClient
//单例，每次只允许一次网络请求
+ (APIClient *)sharedManager
{
    static APIClient *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        if(manager == nil)
        {
            manager = [[APIClient alloc] init];
        }
    });
    
    return manager;

}

- (void)netWorkGetHomePageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum success :(void (^) (Response *response))success failure : (void (^) (NSError *error))failure
{
    NSDictionary *parmDic=[NSDictionary dictionaryWithObjectsAndKeys:@(pageSize),@"limit",@(pageNum),@"skip", nil];
    
    [[NetTool shareManager] httpGetRequest:kApi_Get_HomePageList withParameter:parmDic success:^(Response *response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

@end

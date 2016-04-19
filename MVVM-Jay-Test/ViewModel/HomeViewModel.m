//
//  HomeViewModel.m
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "HomeViewModel.h"
#import "APIClient.h"
#import "Response.h"
#import "HomeModel.h"
@implementation HomeViewModel

- (void)handleDataWithSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    
    [[APIClient sharedManager]netWorkGetHomePageSize:20 pageNum:0 success:^(Response *response) {
        NSLog(@".......respone.description : %@",response.description);
        if (response.status==kEnumServerStateSuccess) {
            NSLog(@"请求成功!");
            NSMutableArray *tmpArr=[NSMutableArray array];
            for (NSDictionary *subDic in (NSArray *)[response.data valueForKey:@"results"]) {
                HomeModel *model=[[HomeModel alloc]initWithDic:subDic];
                [tmpArr addObject:model];
            }
            success(tmpArr);
        }
        
    } failure:^(NSError *error) {
 
         failure(error);
    }];
    
    
    

}

@end

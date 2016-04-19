//
//  HomeViewModel.h
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject
//处理网络获取的数据
- (void)handleDataWithSuccess: (void (^) (NSArray *arr))success failure:(void (^) (NSError *error))failure;

@end

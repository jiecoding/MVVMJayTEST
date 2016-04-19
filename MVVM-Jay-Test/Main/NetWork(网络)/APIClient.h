//
//  APIClient.h
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
@interface APIClient : NSObject

+ (APIClient *)sharedManager;

- (void)netWorkGetHomePageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum success :(void (^) (Response *response))success failure : (void (^) (NSError *error))failure;

@end

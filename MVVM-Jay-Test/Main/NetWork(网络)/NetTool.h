//
//  NetTool.h
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
@interface NetTool : NSObject

+ (NetTool *)shareManager;


- (void)httpGetRequest:(NSString *)url withParameter:(NSDictionary *)parameter success:(void (^)(Response *response))success failure:(void (^)(NSError *error))failure;
@end

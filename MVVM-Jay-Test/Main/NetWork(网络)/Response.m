//
//  Response.m
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "Response.h"

@implementation Response

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    kEnumServerState flag=kEnumServerStateSuccess;
    NSObject *data=@"";
    NSString *message=@"";
    NSString *status=@"";
    if ([dic valueForKey:@"code"]) {
        flag=[[dic valueForKey:@"code"]intValue];
    }
    data=[dic objectForKey:@"data"];
    message=[dic valueForKey:@"msg"];
    status=[dic valueForKey:@"status"];
    return [self initWithState:flag result:data message:message];
}

- (Response *)initWithState:(kEnumServerState)state result:(NSObject *)data message:(NSString *)message{
    self=[super init];
    if (self) {
        _status=state;
        _data=data;
        _msg=message;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"status=%@, data=%@, message=%@",@(_status), _data,_msg];
}




@end

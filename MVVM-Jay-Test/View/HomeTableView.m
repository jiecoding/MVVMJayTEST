//
//  HomeTableView.m
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "HomeTableView.h"
#import "Define.h"
@implementation HomeTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self setBackgroundColor:kAppMainBgColor];
    }
    
    return self;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

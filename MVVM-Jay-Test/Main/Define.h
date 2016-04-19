//
//  Define.h
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#ifndef Define_h
#define Define_h


#pragma mark 获取当前屏幕的宽度、高度
//宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//字体
#define UIFont_size(size) [UIFont systemFontOfSize:size]


#define UICOLOR_FROM_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kAppMainBgColor UICOLOR_FROM_RGB(240,240,240,1)


#endif /* Define_h */

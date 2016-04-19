//
//  HomeTableViewCell.m
//  MVVM-Jay-Test
//
//  Created by keep on 16/4/19.
//  Copyright © 2016年 keep. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIView+Utils.h"
#import "Define.h"
#import "UIImageView+WebCache.h"
@interface HomeTableViewCell ()

@property (nonatomic,strong)UIImageView *newsImageView;//图片
@property (nonatomic,strong)UILabel *newsTitleLabel; //标题
@property (nonatomic,strong)UILabel *newsSourceLabel;//来源
@property (nonatomic,strong)UILabel *newsTypeLabel;//类型
@end

@implementation HomeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setUpView];
    }
    return self;
}


- (void)setUpView
{
//    self.backgroundColor = [UIColor redColor];  https://github.com/shenAlexy/MVVM 源码有注解
    //这样写的好处是:延迟实例化 只有真正用到的时候，这个对象才会被创建。节约了内存
    [self addSubview:self.newsImageView];
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.newsSourceLabel];
    [self addSubview:self.newsTypeLabel];
}

- (UILabel *)newsTitleLabel
{
    if(!_newsTitleLabel)
    {
        _newsTitleLabel  = [[UILabel alloc] init];
        _newsTitleLabel.frame = CGRectMake(self.newsImageView.current_x_w+10, self.newsImageView.current_y + 10, kScreenWidth -self.newsImageView.current_x_w-20.0, 40);
        _newsTitleLabel.text = @"testTitle";
        [_newsTitleLabel setFont:UIFont_size(15.0)];
        [_newsTitleLabel setTextAlignment:NSTextAlignmentLeft];

    }
    return _newsTitleLabel;
}

- (UILabel *)newsSourceLabel
{
    if(!_newsSourceLabel)
    {
        _newsSourceLabel = [[UILabel alloc] init];
        [_newsSourceLabel setFrame:CGRectMake(self.newsTitleLabel.current_x, 55.0, self.newsTitleLabel.current_w/2, 15.0)];
        [_newsSourceLabel setFont:UIFont_size(12.0)];
        _newsSourceLabel.text = @"testSource";

    }
    
    return _newsSourceLabel;
}

- (UILabel *)newsTypeLabel
{
    if(!_newsTypeLabel)
    {
        _newsTypeLabel = [[UILabel alloc] init];
        [_newsTypeLabel setFrame:CGRectMake(self.newsImageView.current_x_w+self.newsTitleLabel.current_w/2+10.0, self.newsSourceLabel.current_y, self.newsSourceLabel.current_w, self.newsSourceLabel.current_h)];
        [_newsTypeLabel setTextAlignment:NSTextAlignmentRight];
        [_newsTypeLabel setFont:UIFont_size(12.0)];
        _newsTypeLabel.text = @"testType";
    }
    
    return _newsTypeLabel;
}

#pragma mark - setData
- (void)setData:(HomeModel *)data{
    if (data) {
        _data=data;
        [self loadViewData];
    }
}

- (void)loadViewData{
    //图片
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:_data.newsImage] placeholderImage:[UIImage imageNamed:@"tu_empty"]];
    //标题
    [self.newsTitleLabel setText:_data.newsTitle];
    //来源
    [self.newsSourceLabel setText:_data.newsSource];
    //类型
    [self.newsTypeLabel setText:_data.newsTypeName];
}


- (UIImageView *)newsImageView

{
    if(!_newsImageView)
    {
        _newsImageView = [[UIImageView alloc] init];
        _newsImageView.frame = CGRectMake(10, 10, 85, 60);
        _newsImageView.image = [UIImage imageNamed:@"tu_empty"];
    }
    
    return _newsImageView;
}



@end

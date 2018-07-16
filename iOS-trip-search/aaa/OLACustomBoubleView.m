//
//  OLACustomBoubleView.m
//  iOS-trip-search
//
//  Created by niuge on 2018/7/13.
//  Copyright © 2018年 Amap. All rights reserved.
//

#import "OLACustomBoubleView.h"
#import "UIView+OLAExtension.h"
#import "UIView+Visuals.h"

@implementation OLACustomBoubleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)setUI{
    self.backgroundColor = [UIColor redColor];
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleLabel];
    _titleLabel.backgroundColor = [UIColor blueColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)sizeToFitTitle:(NSString *)title{
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.x = 8;
    self.width = _titleLabel.width += 16;
    [self setChatBoubleWith:10];
}


@end

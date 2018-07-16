//
//  OLACustomBoubleView.h
//  iOS-trip-search
//
//  Created by niuge on 2018/7/13.
//  Copyright © 2018年 Amap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OLACustomBoubleView : UIView
@property (nonatomic,strong) UILabel *titleLabel;
-(void)sizeToFitTitle:(NSString *)title;
@end

//
//  UIView+Visuals.h
//
//  Created by Heiko Dreyer on 25.05.11.
//  Copyright 2011 boxedfolder.com. All rights reserved.
//  https://github.com/bfolder/UIView-Visuals

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIView (Visuals)

/**
 设置优惠券不规则圆角
 @param radius 圆角半径
 */
-(void)setCouponsSepraWithradius:(CGFloat)radius;

/**
 设置聊天气泡形状

 @param triH 底部等边三角形高度
 */
-(void)setChatBoubleWith:(CGFloat)triH;


/**
 画圆

 @param radius 半径
 */
-(void)setCircleWithWith:(CGFloat)radius;

/**
 设置圆角 边线 边线颜色

 @param radius 圆角半径
 @param size 边线宽
 @param color 边线颜色
 */
-(void)cornerRadius: (CGFloat)radius
         strokeSize: (CGFloat)size 
              color: (UIColor *)color;

/**
 设置圆角

 @param corners 圆角位置
 @param radius 圆角半径
 */
-(void)setRoundedCorners:(UIRectCorner)corners
                  radius:(CGFloat)radius;


/**
 设置阴影

 @param color 颜色
 @param offset 偏移量
 @param opacity The opacity of the shadow. Defaults to 0. Specifying a value outside the
 * [0,1] range will give undefined results. Animatable.
 @param radius 圆角半径
 */
-(void)shadowWithColor: (UIColor *)color
                offset: (CGSize)offset 
               opacity: (CGFloat)opacity 
                radius: (CGFloat)radius;

/*
 *  Removes from superview with fade
 */
-(void)removeFromSuperviewWithFadeDuration: (NSTimeInterval)duration;

/*
 *  Adds a subview with given transition & duration
 */
-(void)addSubview: (UIView *)view withTransition: (UIViewAnimationTransition)transition duration: (NSTimeInterval)duration;

/*
 *  Removes view from superview with given transition & duration
 */
-(void)removeFromSuperviewWithTransition: (UIViewAnimationTransition)transition duration: (NSTimeInterval)duration;

/*
 *  Rotates view by given angle. TimingFunction can be nil and defaults to kCAMediaTimingFunctionEaseInEaseOut.
 */
-(void)rotateByAngle: (CGFloat)angle 
            duration: (NSTimeInterval)duration 
         autoreverse: (BOOL)autoreverse
         repeatCount: (CGFloat)repeatCount
      timingFunction: (CAMediaTimingFunction *)timingFunction;

/*
 *  Moves view to point. TimingFunction can be nil and defaults to kCAMediaTimingFunctionEaseInEaseOut.
 */
-(void)moveToPoint: (CGPoint)newPoint 
          duration: (NSTimeInterval)duration 
       autoreverse: (BOOL)autoreverse
       repeatCount: (CGFloat)repeatCount
    timingFunction: (CAMediaTimingFunction *)timingFunction;

@end

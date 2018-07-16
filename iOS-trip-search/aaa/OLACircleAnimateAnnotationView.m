//
//  OLACircleAnimateAnnotationView.m
//  OLA-iOS
//
//  Created by niuge on 2018/7/11.
//  Copyright © 2018年 Angela. All rights reserved.
//

#import "OLACircleAnimateAnnotationView.h"
#import "OLACircleAnimateAnnotation.h"
#define kWidth          400
#define kHeight         400
@implementation OLACircleAnimateAnnotationView

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self){
        [self setBounds:CGRectMake(0.f, 0.f, kWidth, kHeight)];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}


- (void)updateImageView{
    [self.layer addSublayer:[[self class] groupLayerAnimationsWithSize:self.bounds.size]];
}


+ (CAAnimationGroup *)pulseAnimationGroup
{
    CAAnimationGroup *pulseAnimationGroup = [CAAnimationGroup animation];
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    pulseAnimationGroup = [CAAnimationGroup animation];
    pulseAnimationGroup.duration = 2;
    pulseAnimationGroup.repeatCount = INFINITY;
    pulseAnimationGroup.removedOnCompletion = NO;
    pulseAnimationGroup.timingFunction = defaultCurve;
    
    NSMutableArray *animations = [NSMutableArray new];
    
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    pulseAnimation.fromValue = @0.0;
    pulseAnimation.toValue = @1.0;
    pulseAnimation.duration = 3;
    [animations addObject:pulseAnimation];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 3;
    animation.values = @[@0.45, @0.45, @0];
    animation.keyTimes = @[@0, @0.2, @1];
    animation.removedOnCompletion = NO;
    [animations addObject:animation];
    
    pulseAnimationGroup.animations = animations;
    
    return pulseAnimationGroup;
}

+ (CALayer*)colorDotLayerWithSize:(CGSize)size WithBeginTime:(NSTimeInterval)time {
    CALayer *colorDotLayer = [CALayer layer];
    CGFloat width = size.width - 6;
    colorDotLayer.bounds = CGRectMake(0, 0, width, width);
    colorDotLayer.allowsGroupOpacity = YES;
    colorDotLayer.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4].CGColor;  //kRedColor.CGColor;//
    colorDotLayer.cornerRadius = width/2;
    colorDotLayer.position = CGPointMake(size.width/2, size.height/2);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = 3;
        animationGroup.repeatCount = INFINITY;
        animationGroup.removedOnCompletion = NO;
        //            animationGroup.autoreverses = YES;
        animationGroup.timingFunction = defaultCurve;
        //            animationGroup.speed = 1;
        animationGroup.fillMode = kCAFillModeBoth;
        animationGroup.timeOffset = time;
        
        CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
        pulseAnimation.fromValue = @0.001;
        pulseAnimation.toValue = @1;
        pulseAnimation.duration =3;
        
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @1;
        opacityAnimation.toValue = @0.;
        opacityAnimation.duration = 3;
        
        animationGroup.animations = @[pulseAnimation, opacityAnimation];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [colorDotLayer addAnimation:animationGroup forKey:@"pulse"];
        });
    });
    return colorDotLayer;
}

+ (CALayer *)groupLayerAnimationsWithSize:(CGSize )size
{
    CALayer *groupLayer = [CALayer layer];
    CGFloat width = size.width;
    groupLayer.bounds = CGRectMake(0, 0, width, width);
    groupLayer.allowsGroupOpacity = YES;
    groupLayer.cornerRadius = width/2;
    groupLayer.position = CGPointMake(size.width/2, size.height/2);
    CALayer *oneLayer = [self colorDotLayerWithSize:size WithBeginTime:0];
    CALayer *twoLayer = [self colorDotLayerWithSize:size WithBeginTime:1.];
    CALayer *threeLayer = [self colorDotLayerWithSize:size WithBeginTime:2];
    
    [groupLayer addSublayer:oneLayer];
    [groupLayer addSublayer:twoLayer];
    [groupLayer addSublayer:threeLayer];
    return groupLayer;
}


#pragma mark - Override

- (void)setAnnotation:(id<MAAnnotation>)annotation
{
    [super setAnnotation:annotation];
    [self updateImageView];
}

@end

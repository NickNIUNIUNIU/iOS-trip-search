//
//  OLACircleAnimateAnnotation.h
//  OLA-iOS
//
//  Created by niuge on 2018/7/11.
//  Copyright © 2018年 Angela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
@interface OLACircleAnimateAnnotation : NSObject<MAAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
@end

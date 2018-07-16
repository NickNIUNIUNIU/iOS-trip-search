//
//  OLACircleAnimateAnnotation.m
//  OLA-iOS
//
//  Created by niuge on 2018/7/11.
//  Copyright © 2018年 Angela. All rights reserved.
//

#import "OLACircleAnimateAnnotation.h"

@implementation OLACircleAnimateAnnotation
@synthesize coordinate = _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    if (self = [super init])
    {
        self.coordinate = coordinate;
    }
    return self;
}
@end

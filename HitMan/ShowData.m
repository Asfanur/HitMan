//
//  ShowData.m
//  HitMan
//
//  Created by Asfanur Arafin on 20/07/2015.
//  Copyright (c) 2015 Asfanur Arafin. All rights reserved.
//

#import "ShowData.h"

@implementation ShowData

-(instancetype) initWithName:(NSString *)name andstartTime:(NSString *)startTime endTime:(NSString *)endTime channell:(NSString *)chanell andRating:(NSString *)rating{
    self = [super init];
    if (self) {
        _name = name;
        _startTime =startTime;
        _endTime = endTime;
        _channel = chanell;
        _rating = rating;
    }
    
    return self;
}


@end

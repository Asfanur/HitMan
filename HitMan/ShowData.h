//
//  ShowData.h
//  HitMan
//
//  Created by Asfanur Arafin on 20/07/2015.
//  Copyright (c) 2015 Asfanur Arafin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowData : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *startTime;
@property (nonatomic,strong) NSString *endTime;
@property (nonatomic,strong) NSString *channel;
@property (nonatomic,strong) NSString *rating;

-(instancetype) initWithName:(NSString *)name andstartTime:(NSString *)startTime endTime:(NSString *)endTime channell:(NSString *)chanell andRating:(NSString *)rating;

@end

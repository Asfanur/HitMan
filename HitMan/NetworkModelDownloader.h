//
//  NetworkModelDownloader.h
//  HitMan
//
//  Created by Asfanur Arafin on 20/07/2015.
//  Copyright (c) 2015 Asfanur Arafin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkModelDownloader : NSObject

typedef void (^CompletionBlock)(NSError *error, NSDictionary *jsonDictionary);

+(void)fetchMovieData:(NSNumber *)offset withCompletionBlock:(CompletionBlock)completionBlock;


@end

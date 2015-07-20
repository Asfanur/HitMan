//
//  NetworkModelDownloader.m
//  HitMan
//
//  Created by Asfanur Arafin on 20/07/2015.
//  Copyright (c) 2015 Asfanur Arafin. All rights reserved.
//

#import "NetworkModelDownloader.h"

@interface NetworkModelDownloader()
typedef void (^FetchQueryCompletionBlock) (NSData *data, NSURLResponse *response, NSError *error);
@end

@implementation NetworkModelDownloader
#define kBaseURL @"http://www.whatsbeef.net/wabz/guide.php?start="
+(void)fetchMovieData:(NSNumber *)offset withCompletionBlock:(CompletionBlock)completionBlock {
    NSString *movieURl = [NSString stringWithFormat:@"%@%@",kBaseURL,offset];
    [self fetchQuery:movieURl withCompletionBlock:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completionBlock(error,nil);
        } else {
           NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:kNilOptions
                                                                            error:&error];
            completionBlock(error,jsonDictionary);
        }
    }];
    
    
}


+(void)fetchQuery:(NSString *)url withCompletionBlock:(FetchQueryCompletionBlock)completionBlock {
    NSURLSession *session = [NSURLSession sharedSession];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(data,response,error);
        });
    }];
    
    [dataTask resume];
    
    
    
}

@end

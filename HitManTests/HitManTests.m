//
//  HitManTests.m
//  HitManTests
//
//  Created by Asfanur Arafin on 20/07/2015.
//  Copyright (c) 2015 Asfanur Arafin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NetworkModelDownloader.h"

@interface HitManTests : XCTestCase

@end

@implementation HitManTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNetworkModelDownloader {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"Test expectation"];
    [NetworkModelDownloader fetchMovieData:@0
                       withCompletionBlock:^(NSError *error, NSDictionary *jsonDictionary) {
                           XCTAssertNotNil(jsonDictionary, "data should not be nill");
                           XCTAssertNil(error,"Error should be nil");
                           [testExpectation fulfill];
                       }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

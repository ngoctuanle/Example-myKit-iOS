//
//  Example_ObjCTests.m
//  Example-ObjCTests
//
//  Created by Tuan Le on 6/27/16.
//  Copyright © 2016 Tuan Le. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Example_ObjCTests : XCTestCase

@end

@implementation Example_ObjCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

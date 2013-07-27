//
//  YahtzeeUnitTests.m
//  YahtzeeUnitTests
//
//  Created by Jessica Thrasher on 7/16/13.
//
//

#import "YahtzeeUnitTests.h"
#import "YahtzeeController.h"

@implementation YahtzeeUnitTests

YahtzeeController *controller;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    [controller awakeFromNib];
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testStartup
{
    STAssertEqualObjects(@1, @1, @"Testing");

    BOOL checkLower = [controller checkLower];
    BOOL checkUpper = [controller checkUpper];
    
    STAssertFalse(checkLower, @"Lower is not done");
    STAssertFalse(checkUpper, @"Upper is not done");

}

@end

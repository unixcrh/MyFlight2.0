//
//  searchFlightData.m
//  MyFlight2.0
//
//  Created by WangJian on 12-12-10.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import "SearchFlightData.h"

@implementation SearchFlightData

+(SearchFlightData *)defaultSearchFlightData
{
    static SearchFlightData * search = nil;
    if (search==nil)
    {
        search = [[SearchFlightData alloc] init];
    }
    return search;
}
@end

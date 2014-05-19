//
//  M2MParser.m
//  FiveS
//
//  Created by Sidney de Koning on 1/27/14.
//  Copyright (c) 2014 m2mobi. All rights reserved.
//

#import "SDKParser.h"
#import "SDKParsingProtocol.h"

@implementation SDKParser

+ (NSDictionary *)parseResultWithData:(id)JSONasDict dataClass:(Class)dataClass;
{
	NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    
    Class classForElement = [dataClass class];
	BOOL doesConform = [classForElement conformsToProtocol:@protocol(SDKParsingProtocol)];

	if (doesConform) {
		id newObject = [[classForElement alloc] init];
		[newObject parseData:JSONasDict];

		[result setObject:newObject forKey:@"result"];
	}
	return result;
}

@end

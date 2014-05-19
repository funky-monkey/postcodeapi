//
//  PostcodeBAG.m
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "PostcodeBAG.h"

@implementation PostcodeBAG

- (id)initWithParseData:(NSDictionary *)parseDataDict
{
	if (self == [super init]) {
		self.bagID = [parseDataDict[@"resource"][@"id"] intValue];
		self.bagType = parseDataDict[@"resource"][@"type"];
		self.bagPurpose = parseDataDict[@"resource"][@"purpose"];
	}
	return self;
}

@end

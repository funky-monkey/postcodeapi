//
//  PostcodeBAG.m
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "SDKPostcodeBAG.h"

@implementation SDKPostcodeBAG

- (id)parseData:(NSDictionary *)parseDataDict
{
	self.bagID = [parseDataDict[@"resource"][@"bag"][@"id"] intValue];
	self.bagPurpose = parseDataDict[@"resource"][@"bag"][@"purpose"];
	self.bagType = parseDataDict[@"resource"][@"bag"][@"type"];

	return self;
}

@end

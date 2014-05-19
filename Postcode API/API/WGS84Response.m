//
//  WGS84Response.m
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "WGS84Response.h"

@implementation WGS84Response

- (id)parseData:(NSDictionary *)parseDataDict
{
	[super parseData:parseDataDict];

	self.postcode = parseDataDict[@"resource"][@"postcode"];
	self.street = parseDataDict[@"resource"][@"street"];
	self.houseNumber = [parseDataDict[@"resource"][@"house_number"] intValue];
	self.town = parseDataDict[@"resource"][@"town"];
    
    self.bag = [[PostcodeBAG alloc]initWithParseData:parseDataDict];

	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Full Object:%@, %@, %@, %f, %f, %d, %ld", self.street, self.postcode, self.town, self.latitude, self.longitude, self.success, (long)self.responseCode];
}

@end

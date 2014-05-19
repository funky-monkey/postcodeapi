//
//  P4PostcodeResponse.m
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "P4PostcodeResponse.h"

@implementation P4PostcodeResponse

- (id)parseData:(NSDictionary *)parseDataDict
{
	self.latitude = [parseDataDict[@"resource"][@"latitude"] floatValue];
	self.longitude = [parseDataDict[@"resource"][@"longitude"] floatValue];
    self.municipality = parseDataDict[@"resource"][@"municipality"];
	self.town = parseDataDict[@"resource"][@"town"];
    self.x = [parseDataDict[@"resource"][@"x"] floatValue];
    self.y = [parseDataDict[@"resource"][@"y"] floatValue];

   	self.success = [parseDataDict[@"success"] boolValue];
	self.error = (parseDataDict[@"resource"][@"error"] ? : [NSNull null]);
	self.responseCode = [parseDataDict[@"resource"][@"code"] intValue];
    
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"P4 Object: %@, %f, %f, %d, %ld",  self.town, self.latitude, self.longitude, self.success, (long)self.responseCode];
}

@end

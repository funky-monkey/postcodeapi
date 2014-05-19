//
//  AdresResponse.m
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "AdresResponse.h"

@implementation AdresResponse

- (id)parseData:(NSDictionary *)parseDataDict
{
	[super parseData:parseDataDict];
    return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Full Object:%@, %@, %@, %f, %f, %d, %ld", self.street, self.postcode, self.town, self.latitude, self.longitude, self.success, (long)self.responseCode];
}

@end
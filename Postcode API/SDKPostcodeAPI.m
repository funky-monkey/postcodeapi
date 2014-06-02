//
//  PostcodeAPI.m
//  Postcode API
//
//  Created by Sidney de Koning on 15/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "SDKPostcodeAPI.h"

// Parsed Classes
#import "SDKPostcodeResponse.h"
#import "SDKP4PostcodeResponse.h"
#import "SDKWGS84Response.h"

// Helper Classes
#import "SDKAPIManager.h"
#import "SDKPostcodeAPIConstants.h"

NSString *apiKey;
SDKAPIManager *apiManager;

@implementation SDKPostcodeAPI

- (id)initWithAPIKey:(NSString *)apikey
{
	if (self = [super init]) {
		apiKey = apikey;
	}
	return self;
}

- (void)requestAddressWithPostcode:(NSString *)postcode withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
                           failure:(void (^)(NSError *error))failure;
{
	[self makeAPICall:postcode withHouseNumber:0 withLatLong:nil withBAG:bag success:success failure:failure];
}
- (void)requestAddressWithPostcode:(NSString *)postcode withHouseNumber:(NSInteger)houseNumber withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
                           failure:(void (^)(NSError *error))failure;
{
	[self makeAPICall:postcode withHouseNumber:houseNumber withLatLong:nil withBAG:bag success:success failure:failure];
}
- (void)requestWGS84WithLatLong:(CLLocation *)latlong withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
                        failure:(void (^)(NSError *error))failure;
{
	[self makeAPICall:nil withHouseNumber:0 withLatLong:latlong withBAG:bag success:success failure:failure];
}

- (void)makeAPICall:(NSString *)postCode withHouseNumber:(NSInteger)houseNumber withLatLong:(CLLocation *)latlong withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
            failure:(void (^)(NSError *error))failure;
{
	NSMutableDictionary *paramObject = [[NSMutableDictionary alloc]init];
	NSString *path;
	Class classToParse;

	if (postCode) {
		postCode = ((postCode) ? postCode : @"");

		if ([postCode length] == 4) {
			[paramObject setObject:@"p4" forKey:@"type"];
			classToParse = [SDKP4PostcodeResponse class];
		} else if ([postCode length] == 5) {
			[paramObject setObject:@"p5" forKey:@"type"];
			classToParse = [SDKP4PostcodeResponse class];
		}
		if ([postCode length] == 6) {
			[paramObject setObject:@"p6" forKey:@"type"];
			classToParse = [SDKPostcodeResponse class];
		}

		path = [NSString stringWithFormat:@"%@", postCode];
	}

	if (houseNumber) {
		houseNumber = (houseNumber == 0) ? : houseNumber;
		path = [NSString stringWithFormat:@"%@/%ld", postCode, (long)houseNumber];
		classToParse = [SDKPostcodeResponse class];
	}

	if (latlong) {
		path = [NSString stringWithFormat:@"%@/%f,%f", @"wgs84", latlong.coordinate.latitude, latlong.coordinate.longitude];
		classToParse = [SDKWGS84Response class];
	}

	if (bag) {
		[paramObject setObject:@"bag" forKey:@"view"];
	}

	[[SDKAPIManager alloc] initWithURL:kPostcodeBaseURL
	                              path:path
	                            params:paramObject
	                        classToMap:classToParse
	                        dataSource:nil
	                       credentials:nil
	                            apiKey:apiKey
	                           success: ^(id result) {
	    SDKPostcodeResponse *po = [result objectForKey:@"result"];
	    success(po);
	} failure: ^(NSError *error) {
	    failure(error);
	}];
}

@end

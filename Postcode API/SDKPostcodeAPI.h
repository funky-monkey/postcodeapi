//
//  SDKPostcodeAPI.h
//  Postcode API
//
//  Created by Sidney de Koning on 15/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// Helper Classes
#import "SDKAPIManager.h"
#import "SDKPostcodeResponse.h"

@interface SDKPostcodeAPI : NSObject

- (id)initWithAPIKey:(NSString *)apikey;
- (void)requestAddressWithPostcode:(NSString *)postcode withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
                           failure:(void (^)(NSError *error))failure;

- (void)requestAddressWithPostcode:(NSString *)postcode withHouseNumber:(NSInteger)houseNumber withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
                           failure:(void (^)(NSError *error))failure;

- (void)requestWGS84WithLatLong:(CLLocation *)latlong withBAG:(BOOL)bag success:(void (^)(SDKPostcodeResponse *responseObject))success
                        failure:(void (^)(NSError *error))failure;

@end

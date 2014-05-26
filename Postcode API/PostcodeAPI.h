//
//  PostcodeAPI.h
//  Postcode API
//
//  Created by Sidney de Koning on 15/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// Helper Classes
#import "SDKAPIManager.h"

@interface PostcodeAPI : NSObject

@property (nonatomic, strong) NSString *apiKey;
@property (nonatomic, strong) SDKAPIManager *apiManager;
- (id)initWithAPIKey:(NSString *)apikey;
- (void)requestAddressWithPostcode:(NSString *)postcode withBAG:(BOOL)bag success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

- (void)requestAddressWithPostcode:(NSString *)postcode withHouseNumber:(NSInteger)houseNumber withBAG:(BOOL)bag success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

- (void)requestWGS84WithLatLong:(CLLocation *)latlong withBAG:(BOOL)bag success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure;

@end

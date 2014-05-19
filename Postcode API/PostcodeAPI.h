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
- (void)type:(NSString *)value;
- (void)requestAddressWithPostcode:(NSString *)postcode withBAG:(BOOL)bag;
- (void)requestAddressWithPostcode:(NSString *)postcode withHouseNumber:(NSInteger)houseNumber withBAG:(BOOL)bag;
- (void)requestWGS84WithLatLong:(CLLocation *)latlong withBAG:(BOOL)bag;

@end

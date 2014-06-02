//
//  SDKViewController.m
//  Postcode API
//
//  Created by Sidney de Koning on 15/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "SDKViewController.h"
#import "SDKAPIManager.h"
#import "SDKPostcodeAPI.h"
#import <CoreLocation/CoreLocation.h>

// Helper Classes
#import "AFNetworkActivityLogger.h"
#import "SDKPostcodeResponse.h"
#import "SDKPostcodeAPIConstants.h"

@interface SDKViewController ()

@end

@implementation SDKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
    
	CLLocationDegrees lat = 51.5664;
	CLLocationDegrees lon = 5.07718;
	CLLocation *fakeLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

	SDKPostcodeAPI *pc = [[SDKPostcodeAPI alloc] initWithAPIKey:@"[Your API key goes here]"];
    
	[pc requestAddressWithPostcode:@"1021NG" withBAG:YES
                           success: ^(SDKPostcodeResponse *responseObject) {
                                // Returns an PostcodeResponse
                            } failure: ^(NSError *error) {
                                // Handle error here.
                            }];

	[pc requestAddressWithPostcode:@"1021NG" withHouseNumber:58 withBAG:YES
	                       success: ^(SDKPostcodeResponse *responseObject) {
                                // Returns an PostcodeResponse
                            } failure: ^(NSError *error) {
                                // Handle error here.
                            }];

    [pc requestWGS84WithLatLong:fakeLocation withBAG:YES
                        success:^(SDKPostcodeResponse *responseObject) {
                            // Returns an PostcodeResponse
                        } failure:^(NSError *error) {
                            // Handle error here.
                        }];

}

@end

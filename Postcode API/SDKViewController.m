//
//  SDKViewController.m
//  Postcode API
//
//  Created by Sidney de Koning on 15/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "SDKViewController.h"
#import "SDKAPIManager.h"
#import "PostcodeAPI.h"
#import <CoreLocation/CoreLocation.h>

// Helper Classes
#import "PostcodeResponse.h"
#import "PostcodeAPIConstants.h"

@interface SDKViewController ()

@end

@implementation SDKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	CLLocationDegrees lat = 51.5664;
	CLLocationDegrees lon = 5.07718;
	CLLocation *fakeLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

	PostcodeAPI *pc = [[PostcodeAPI alloc] initWithAPIKey:@"[Insert your API key]"];
    
	[pc requestAddressWithPostcode:@"1021NG" withBAG:YES
                           success: ^(id responseObject) {
                                PostcodeResponse *po = responseObject;
                                NSLog(@"po.description: %@", po);
                        } failure: ^(NSError *error) {
                                NSLog(@"Error: %@", error);
                        }];
    
	[pc requestAddressWithPostcode:@"1021NG" withHouseNumber:58 withBAG:YES
	                       success: ^(id responseObject) {
                                PostcodeResponse *po = responseObject;
                                NSLog(@"po.description: %@", po);
                        } failure: ^(NSError *error) {
                                NSLog(@"Error: %@", error);
                            }];

    [pc requestWGS84WithLatLong:fakeLocation withBAG:YES
                        success:^(id responseObject) {
                            PostcodeResponse *po = responseObject;
                            NSLog(@"po.description: %@", po);
                        } failure:^(NSError *error) {
                            NSLog(@"Error: %@", error);
                            
                        }];

}

@end

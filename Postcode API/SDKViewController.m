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
#import "AFNetworkActivityLogger.h"

// Helper Classes
#import "PostcodeResponse.h"
#import "PostcodeAPIConstants.h"

@interface SDKViewController ()

@end

@implementation SDKViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[[AFNetworkActivityLogger sharedLogger] startLogging];
	[[AFNetworkActivityLogger sharedLogger] setLevel:AFLoggerLevelDebug];

	CLLocationDegrees lat = 51.5664;
	CLLocationDegrees lon = 5.07718;
	CLLocation *fakeLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

	PostcodeAPI *pc = [[PostcodeAPI alloc] initWithAPIKey:@"764b819cec504b3df788a25bbf7ae6d9f899e9a6"];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotResult:) name:kResultNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotError:) name:kErrorNotification object:nil];
//	[pc requestAddressWithPostcode:@"1021NG" withBAG:YES];
//    [pc requestAddressWithPostcode:@"1021NG" withHouseNumber:58 withBAG:YES];
    [pc requestWGS84WithLatLong:fakeLocation withBAG:YES];
}

- (void)gotResult:(NSNotification *)notification
{
	PostcodeResponse *po = notification.userInfo[kParseResultObject];
	NSLog(@"po.description: %@", po);
}

- (void)gotError:(NSNotification *)notification
{
	NSLog(@"Error: %@", notification.userInfo[kParseErrorObject]);
}

@end

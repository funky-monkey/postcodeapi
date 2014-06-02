//
//  P4PostcodeResponse.h
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import <Foundation/Foundation.h>

// Helper Classes
#import "SDKParsingProtocol.h"
#import "SDKPostcodeBAG.h"

@interface SDKP4PostcodeResponse : NSObject <SDKParsingProtocol>

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic, assign) NSString *municipality;
@property (nonatomic, assign) NSString *provice;
@property (nonatomic, assign) NSString *town;
@property (nonatomic) float x;
@property (nonatomic) float y;

@property (nonatomic) BOOL success;
@property (nonatomic, assign) NSString *error;
@property (nonatomic, assign) NSInteger responseCode;
@property (nonatomic, strong) SDKPostcodeBAG *bag;

- (NSString *)description;

@end

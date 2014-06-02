//
//  PostcodeResponse.h
//  Postcode API
//
//  Created by Sidney de Koning on 15/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import <Foundation/Foundation.h>

// Helper Classes
#import "SDKParsingProtocol.h"
#import "SDKP4PostcodeResponse.h"

@interface SDKPostcodeResponse : SDKP4PostcodeResponse <SDKParsingProtocol>

@property (nonatomic, assign) NSString *postcode;
@property (nonatomic, assign) NSString *street;

- (NSString *)description;

@end

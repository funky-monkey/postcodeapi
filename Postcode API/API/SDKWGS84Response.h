//
//  WGS84Response.h
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "SDKP4PostcodeResponse.h"
#import "SDKPostcodeBAG.h"

@interface SDKWGS84Response : SDKP4PostcodeResponse

@property (nonatomic, assign) NSString *postcode;
@property (nonatomic, assign) NSString *street;
@property (nonatomic, assign) NSInteger houseNumber;
@property (nonatomic, assign) NSString *town;

- (NSString *)description;

@end
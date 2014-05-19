//
//  WGS84Response.h
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "P4PostcodeResponse.h"
#import "PostcodeBAG.h"

@interface WGS84Response : P4PostcodeResponse

@property (nonatomic, assign) NSString *postcode;
@property (nonatomic, assign) NSString *street;
@property (nonatomic, assign) NSInteger houseNumber;
@property (nonatomic, assign) NSString *town;
@property (nonatomic, strong) PostcodeBAG *bag;

- (NSString *)description;

@end
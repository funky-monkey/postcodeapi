//
//  PostcodeBAG.h
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDKParsingProtocol.h"

@interface SDKPostcodeBAG : NSObject <SDKParsingProtocol>

@property (nonatomic) float bagID;
@property (nonatomic) NSString *bagType;
@property (nonatomic) NSString *bagPurpose;

- (id)parseData:(NSDictionary *)parseDataDict;

@end

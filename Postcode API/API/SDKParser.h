//
//  M2MParser.h
//  FiveS
//
//  Created by Sidney de Koning on 1/27/14.
//  Copyright (c) 2014 m2mobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDKParsingProtocol.h"

@interface SDKParser : NSObject

+ (NSDictionary *)parseResultWithData:(id)JSONasDict dataClass:(Class)dataClass;

@end

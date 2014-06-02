//
//  M2MParsingProtocol.h
//  FiveS
//
//  Created by Sidney de Koning on 1/27/14.
//  Copyright (c) 2014 m2mobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SDKParsingProtocol <NSObject>

- (id)parseData:(NSDictionary *)parseDataDict;

@end

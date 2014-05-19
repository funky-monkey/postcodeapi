//
//  M2MAPIManager.h
//  FiveS
//
//  Created by Sidney de Koning on 1/27/14.
//  Copyright (c) 2014 m2mobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDKParsingProtocol.h"

@interface SDKAPIManager : NSObject

- (void)initWithURL:(NSString *)baseURL
               path:(NSString *)path
             params:(NSDictionary *)params
         classToMap:(Class)ctm
         dataSource:(id <UITableViewDataSource> )data
        credentials:(NSURLCredential *)cred
             apiKey:(NSString *)apiKey
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;

@end

//
//  M2MHeinekenAPIWrapper.m
//  FiveS
//
//  Created by Sidney de Koning on 1/27/14.
//  Copyright (c) 2014 m2mobi. All rights reserved.
//

#import "SDKAPIManager.h"
#import "SDKParser.h"
#import "SDKPostcodeAPIConstants.h"

// AFnetworking
#import "AFNetworking.h"

@implementation SDKAPIManager

- (void)initWithURL:(NSString *)baseURL
               path:(NSString *)path
             params:(NSDictionary *)params
         classToMap:(Class)ctm
         dataSource:(id <UITableViewDataSource> )data
        credentials:(NSURLCredential *)cred
             apiKey:(NSString *)apiKey
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;
{
	if (self == [super init]) {
		NSString *fullURL = [NSString stringWithFormat:@"%@%@", baseURL, path];

		AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
		manager.responseSerializer = [AFJSONResponseSerializer serializer];
		manager.requestSerializer = [AFJSONRequestSerializer serializer];
		if (apiKey) {
			[manager.requestSerializer setValue:apiKey forHTTPHeaderField:kPostCodeHeaderAPIKey];
		}

		if (cred) {
			[manager setCredential:cred];
		}

		[manager  POST:fullURL
		    parameters:params
		       success: ^(AFHTTPRequestOperation *operation, id JSON) {
                   NSLog(@"RAW JSON Data: %@", JSON);
		    success([SDKParser parseResultWithData:JSON dataClass:ctm]);
		}

		       failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
		    failure(error);
		}

		];
	}
}

@end

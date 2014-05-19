//
//  AdresResponse.h
//  Postcode API
//
//  Created by Sidney de Koning on 16/05/14.
//  Copyright (c) 2014 Funky Monkey. All rights reserved.
//

#import "WGS84Response.h"
#import "PostcodeBAG.h"

@interface AdresResponse : WGS84Response

@property (nonatomic, assign) PostcodeBAG *BAG;

@end

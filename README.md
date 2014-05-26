#Postcode API

An Objective-C API wrapper for http://api.postcodeapi.nu. This wrapper allows you to lookup Dutch postcodes to street and city names or lat-long regions.

Implements all methods as described in http://api.postcodeapi.nu/docs/ also returns optional BAG information.

This API now support a blockbased API for success and failure handling.

#Usage:
```objc
- (void)viewDidLoad
{
	[super viewDidLoad];

    CLLocationDegrees lat = 51.5664;
	CLLocationDegrees lon = 5.07718;
	CLLocation *fakeLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

	PostcodeAPI *pc = [[PostcodeAPI alloc] initWithAPIKey:@"[Insert your API key]"];
    
    // Vanilla request for adres with postcode
    [pc requestAddressWithPostcode:@"1021NG" withBAG:YES
                       success: ^(id responseObject) {
                            PostcodeResponse *po = responseObject;
                            NSLog(@"po.description: %@", po);
                    } failure: ^(NSError *error) {
                            NSLog(@"Error: %@", error);
                    }];

    // Request Adres with postcode and BAG info
	[pc requestAddressWithPostcode:@"1021NG" withHouseNumber:58 withBAG:YES
	                       success: ^(id responseObject) {
                                PostcodeResponse *po = responseObject;
                                NSLog(@"po.description: %@", po);
                        } failure: ^(NSError *error) {
                                NSLog(@"Error: %@", error);
                            }];
                            
    // Request WGS84 with CLLocation and BAG
    [pc requestWGS84WithLatLong:fakeLocation withBAG:YES
                        success:^(id responseObject) {
                            PostcodeResponse *po = responseObject;
                            NSLog(@"po.description: %@", po);
                        } failure:^(NSError *error) {
                            NSLog(@"Error: %@", error);
                            
                        }];
}
```

BEWARE!
This is raw unrefactored code, needs shoepolish.


## Contributors

Original author: 

 * Sidney de Koning, http://www.funky-monkey.nl

## LICENSE

Copyright (c) 2013 Sidney de Koning

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

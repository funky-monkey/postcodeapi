#Postcode API

An Objective-C API wrapper for http://api.postcodeapi.nu. This wrapper allows you to lookup Dutch postcodes to street and city names or lat-long regions.

Implements all methods as described in http://api.postcodeapi.nu/docs/ also returns optional BAG information.

#Usage:
```
- (void)viewDidLoad
{
	[super viewDidLoad];

	PostcodeAPI *pc = [[PostcodeAPI alloc] initWithAPIKey:@"[Insert your API key]"];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotResult:) name:kResultNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotError:) name:kErrorNotification object:nil];
  	[pc requestAddressWithPostcode:@"1000AB" withBAG:YES];
	//[pc requestAddressWithPostcode:@"1000AB" withHouseNumber:12 withBAG:YES];
	//[pc requestWGS84WithLatLong:fakeLocation withBAG:YES];
}

- (void)gotResult:(NSNotification *)notification
{
	PostcodeResponse *po = notification.userInfo[kParseResultObject];
	NSLog(@"po.description: %@", po);
}

- (void)gotError:(NSNotification *)notification
{
	NSLog(@"Error: %@", notification.userInfo[kParseErrorObject]);
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

#Postcode API
===========

An Objective-C API wrapper for http://api.postcodeapi.nu

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

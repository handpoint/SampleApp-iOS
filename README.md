<img src="https://handpoint.imgix.net/handpoint_logo_transparent.png?w=300">

# SampleApp-iOS
Sample iOS App demonstrating an integration to Handpoint's SDK for iOS.

```
self.handpoint = [[HandpointApiManager alloc]
                      initWithBasicEventsDelegate:self
                      sharedSecret:@"0102030405060708091011121314151617181920212223242526272829303132"
                      automaticReconnection:YES];

   [self.handpoint connectToFirstAvailableDevice];
```

#What to look for?
We've built an intermediate layer to simplify even more integrations. This layer reflects our learnings from several apps developed using the library.

You can take a look at the layer in `HandpointApiManager.m`

This layer will soon become integrated into the SDK and will be the main entry point of it.

You should take a look at how to consume it as this would be our recommended way of integrating going forward. 

See `ViewController.m` for that.

Remember you still need to configure certain parameters in your app for it to work fine using Datecs devices.

See [Getting Started Guide](https://www.handpoint.com/docs/device/iOS/#section_gettingStarted)


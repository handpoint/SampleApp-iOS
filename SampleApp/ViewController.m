//
//  ViewController.m
//  SampleApp
//
//  Created by Juan Nuñez on 20/02/2020.
//  Copyright © 2020 Handpoint. All rights reserved.
//

#import "ViewController.h"
#import "HandpointApiManager.h"
#import "Currency.h"
#import "ConnectionStatus.h"
#import "UIColor+Handpoint.h"

@interface ViewController () <HandpointSampleBasicEvents>
@property (atomic) HandpointApiManager *handpoint;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *sharedSecret = @"0102030405060708091011121314151617181920212223242526272829303132";
    self.handpoint = [[HandpointApiManager alloc]
                      initWithBasicEventsDelegate:self
                      sharedSecret:sharedSecret
                      automaticReconnection:YES];
    [self.handpoint connectToFirstAvailableDevice];
}

- (void)resetLables {
    self.currentTransactionStatus.text = @"";
    self.currentTransactionMessage.text = @"";
    self.multiLineLabel.text = @"";
}

- (void)connectionStatusChanged:(ConnectionStatus)status device:(HeftRemoteDevice *)device {
    switch (status) {
        case ConnectionStatusConnected:
            self.connectionStatus.backgroundColor = [UIColor green];
            self.connectionStatus.text = [NSString stringWithFormat:@"Connected: %@", device.name];
            [self resetLables];
            break;
        case ConnectionStatusDisconnected:
            self.connectionStatus.backgroundColor = [UIColor red];
            self.connectionStatus.text = [NSString stringWithFormat:@"Disconnected: %@", device.name];
            break;
        case ConnectionStatusNotConfigured:
            
            self.connectionStatus.backgroundColor = [UIColor blackColor];
            break;
        default:
            self.connectionStatus.backgroundColor = [UIColor yellow];
            self.connectionStatus.text = @"Wait...";
            break;
    }
}

- (void)currentTransactionStatus:(id <ResponseInfo>)info device:(HeftRemoteDevice *)device {
    self.currentTransactionStatus.text = info.status;
    self.currentTransactionMessage.text = info.description;
}

- (void)endOfTransaction:(id <FinanceResponseInfo>)transactionResult device:(HeftRemoteDevice *)device {
    self.currentTransactionStatus.text = transactionResult.finStatus;
    self.currentTransactionMessage.text = transactionResult.statusMessage;
}

- (void)scannedCodes:(NSArray *)scannedCodes {
    self.multiLineLabel.text = [scannedCodes componentsJoinedByString:@"\n"];
}

- (IBAction)saleButton:(id)sender {
    [self.handpoint saleWithAmount:1000 currency:Currency.USD];
}

- (IBAction)refundButton:(id)sender {
    [self.handpoint refundWithAmount:1200 currency:Currency.USD];
}

- (IBAction)scanOneItemButton:(id)sender {
    [self.handpoint enableScannerWithMultiScan:NO
                                    buttonMode:NO
                                timeoutSeconds:3*60
                       sendScannerCodesGrouped:NO];
}

- (IBAction)multiScanButton:(id)sender {
    [self.handpoint enableScannerWithMultiScan:YES
                                    buttonMode:NO
                                timeoutSeconds:5*60
                       sendScannerCodesGrouped:YES];
}
@end

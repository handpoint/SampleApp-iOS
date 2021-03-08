#import <Foundation/Foundation.h>
#import "HandpointAll.h"
#import "HandpointSampleBasicEvents.h"

@class Currency;

typedef void (^DeviceDiscoveryFinished) (NSArray *devices);
typedef void (^VoidBlock) (void);
typedef void (^ErrorBlock) (NSError *error);

@interface HandpointApiManager: NSObject

@property (readonly) NSString *version;

- (instancetype)initWithBasicEventsDelegate:(id <HandpointSampleBasicEvents>)delegate sharedSecret:(NSString *)sharedSecret automaticReconnection:(BOOL)automaticReconnection;

- (BOOL)saleWithAmount:(NSInteger)amount
              currency:(Currency *)currency;

- (BOOL)saleAndTokenizeCardWithAmount:(NSInteger)amount
                             currency:(Currency *)currency;

- (BOOL)tokenizeCard;

- (BOOL)saleReversalWithAmount:(NSInteger)amount
                      currency:(Currency *)currency
                 transactionId:(NSString *)transactionId;

- (BOOL)refundWithAmount:(NSInteger)amount
                currency:(Currency *)currency;

- (BOOL)refundReversalWithAmount:(NSInteger)amount
                        currency:(Currency *)currency
                   transactionId:(NSString *)transactionId;

- (void)tipAdjustmentWithTransactionId:(NSString *)transactionId
                             tipAmount:(NSInteger)tipAmount
        tipAdjustmentCompletionHandler:(tipAdjustmentCompletionHandler)tipAdjustmentCompletionHandler;

- (void)signatureResult:(BOOL)accepted;

-(BOOL)enableScannerWithMultiScan:(BOOL)multiScan
                       buttonMode:(BOOL)buttonMode
                   timeoutSeconds:(NSInteger)timeoutSeconds
          sendScannerCodesGrouped:(BOOL)sendScannerCodesGrouped;

- (void)disableScanner;

- (void)disconnect;

- (BOOL)setLogLevel:(eLogLevel)logLevel;

- (BOOL)getDeviceLogs;

- (BOOL)getPendingTransaction;

- (BOOL)update;

- (void)listDevices:(DeviceDiscoveryFinished)devicesBlock;

- (void)connectToFirstAvailableDevice;

@end

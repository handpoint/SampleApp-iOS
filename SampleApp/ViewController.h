//
//  ViewController.h
//  SampleApp
//
//  Created by Juan Nuñez on 20/02/2020.
//  Copyright © 2020 Handpoint. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *connectionStatus;
@property (weak, nonatomic) IBOutlet UILabel *currentTransactionStatus;
@property (weak, nonatomic) IBOutlet UILabel *currentTransactionMessage;
@property (weak, nonatomic) IBOutlet UILabel *multiLineLabel;
- (IBAction)saleButton:(id)sender;
- (IBAction)refundButton:(id)sender;
- (IBAction)scanOneItemButton:(id)sender;
- (IBAction)multiScanButton:(id)sender;

@end


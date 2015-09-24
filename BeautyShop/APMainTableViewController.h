//
//  APMainTableViewController.h
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMaster.h"
#import "APPopoverController.h"

@interface APMainTableViewController : UITableViewController <UIAlertViewDelegate>

- (IBAction)writeToMasterAction:(UIButton *)sender;
- (IBAction)deleteServiceAction:(UIButton *)sender;

@end

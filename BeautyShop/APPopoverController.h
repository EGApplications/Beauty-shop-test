//
//  APPopoverController.h
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APServiceDataDelegate <NSObject>

- (void) sendServiceKind:(NSString*) serviceKind duration:(NSString*) duration andCost:(NSString*) cost;

@end

@interface APPopoverController : UITableViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *serviceTextFields;
@property (weak, nonatomic) IBOutlet UIButton *backDoneButton;
@property (weak, nonatomic) id <APServiceDataDelegate> delegate;


- (IBAction)serviceTextFieldsAction:(UITextField *)sender;
- (IBAction)backDoneButtonAction:(UIButton *)sender;


@end

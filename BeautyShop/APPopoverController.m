//
//  APPopoverController.m
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import "APPopoverController.h"

@interface APPopoverController ()

@property (assign, nonatomic) int fillingFieldsStatus;
@property (strong, nonatomic) NSString* minSign;
@property (strong, nonatomic) NSString* rubSign;

@end

@implementation APPopoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fillingFieldsStatus = 0;
    
    self.minSign = @" мин.";
    
    self.rubSign = @" руб.";
    
    [[self.serviceTextFields objectAtIndex:0] becomeFirstResponder];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    
    NSLog(@"popover has been deallocated");
    
}

#pragma mark - Actions

- (IBAction)serviceTextFieldsAction:(UITextField *)sender {
    
    self.fillingFieldsStatus = 0;
    
    NSLog(@"CHECK");
    
    for (UITextField* textField in self.serviceTextFields) {
        
        if ([textField.text length] != 0) {
            
            if ([self.serviceTextFields indexOfObject:textField] == 1) {
                
                if (![textField.text containsString:self.minSign]) {
                
                    textField.text = [textField.text stringByAppendingString:self.minSign];
                    
                }
                
            } else if ([self.serviceTextFields indexOfObject:textField] == 2) {
                
                if (![textField.text containsString:self.rubSign]) {
                
                    textField.text = [textField.text stringByAppendingString:self.rubSign];
                    
                }
                
            }
            
            self.fillingFieldsStatus++;
            
        }
        
    }
    
    if (self.fillingFieldsStatus == 3) {
        
        [self.backDoneButton setTitle:@"Done" forState:UIControlStateNormal];
        
    } else {
        
        [self.backDoneButton setTitle:@"Back" forState:UIControlStateNormal];
        
    }
    
}

- (IBAction)backDoneButtonAction:(UIButton *)sender {
    
    if (self.fillingFieldsStatus < 3) {
        
        [sender setTitle:@"Back" forState:UIControlStateNormal];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        
        NSLog(@"goodbye America");
        
        // Передаем данные обратно для создания услуги.
        
        NSString* serviceKind = [[self.serviceTextFields objectAtIndex:0] text];
        
        NSString* duration = [[self.serviceTextFields objectAtIndex:1] text];
        
        duration = [duration substringToIndex:[duration length] - [self.minSign length]];
        
        NSString* cost = [[self.serviceTextFields objectAtIndex:2] text];
        
        cost = [cost substringToIndex:[cost length] - [self.rubSign length]];
        
        [self.delegate sendServiceKind:serviceKind duration:duration andCost:cost];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:[self.serviceTextFields objectAtIndex:0]]) {
        
        [textField resignFirstResponder];
        
        [[self.serviceTextFields objectAtIndex:1] becomeFirstResponder];
        
    } else if ([textField isEqual:[self.serviceTextFields objectAtIndex:1]]) {
        
        [textField resignFirstResponder];
        
        if (![textField.text containsString:@" мин."]) {
        
            textField.text = [textField.text stringByAppendingString:self.minSign];
        
        }
        
        [[self.serviceTextFields objectAtIndex:2] becomeFirstResponder];
        
    } else {
        
        [textField resignFirstResponder];
        
        if (![textField.text containsString:@" руб."]) {
            
            textField.text = [textField.text stringByAppendingString:self.rubSign];
        
        }
        
    }
    
    return YES;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
    
}

@end

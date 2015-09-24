//
//  APMainTableViewController.m
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import "APMainTableViewController.h"
#import "APHelloCell.h"
#import "APMasterCell.h"
#import "APServiceCell.h"
#import "APClientCell.h"
#import "APAddServiceCell.h"
#import "APMaster.h"
#import "UIView+APServiceCell.h"

@interface APMainTableViewController () <APServiceDataDelegate>

@property (strong, nonatomic) APMaster* master;
@property (strong, nonatomic) NSIndexPath* deletingServiceIndexPath;

@end

@implementation APMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    APMaster* master = [[APMaster alloc] init];
    
    master.name = @"Наталия";
    master.surname = @"Петрова";
    
    master.serviceKind = [NSMutableArray arrayWithObjects:@"Массаж", @"Пилинг", nil];
    
    master.serviceDuration = [NSMutableArray arrayWithObjects:@"60", @"30", nil];
    
    master.serviceCost = [NSMutableArray arrayWithObjects:@"1000", @"600", nil];
    
    self.master = master;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Добро пожаловать + и.ф. мастера
    
    // услуги
    
    // клиенты
    
    NSInteger sections = 2;
    
    // добавить услугу всегда будет
    
    if ([self.master.clientBase count] > 0) {
        
        sections++;
        
    }
    
    return sections;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString* header;
    
    if (section == 1) {
        
        header = @"УСЛУГИ";
        
    } else if (section == 2) {
        
        header = @"КЛИЕНТЫ МАСТЕРА";
        
    }
    
    return header;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger numberOfRows = 0;
    
    switch (section) {
            
        case 0:
            
            numberOfRows = 2;
            
            break;
            
        case 1:
            
            numberOfRows = [self.master.serviceKind count] + 1; // для "Добавить услуги"
            
            break;
            
        case 2:
            
            numberOfRows = [self.master.clientBase count];
            
            break;
            
        default:
            
            NSLog(@"Россия выиграет чемпионат мира 2018!");
            
            break;
            
    }
    
    return numberOfRows;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* helloIdentifier = @"helloCell";
    static NSString* masterIdentifier = @"masterCell";
    static NSString* serviceIdentifier = @"serviceCell";
    static NSString* clientIdentifier = @"clientCell";
    static NSString* addServiceIdentifier = @"addServiceCell";
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        // helloCell
        
        APHelloCell* helloCell = [tableView dequeueReusableCellWithIdentifier:helloIdentifier];
        
        helloCell.welcomeLabel.text = @"Добро пожаловать в Beauty Shop";
        
        return helloCell;
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        // masterCell
        
        APMasterCell* masterCell = [tableView dequeueReusableCellWithIdentifier:masterIdentifier];
        
        masterCell.masterAvatarView.image = [UIImage imageNamed:@"female.png"];
        
//        masterCell.masterWriteView.image = [UIImage imageNamed:@"writeIcon.png"];
        
        masterCell.masterNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.master.name, self.master.surname];
        
        return masterCell;
        
    }  else if (indexPath.section == 1 && indexPath.row == [self.master.serviceKind count]) {
        
        // addServiceCell
        
        if ([self.master.serviceKind count] == 0) {
            
            APAddServiceCell* infoZeroCell = [self.tableView dequeueReusableCellWithIdentifier:addServiceIdentifier];
            
            infoZeroCell.addServiceLabel.text = @"Нет услуг! Кликните, чтобы добавить!";
            
            infoZeroCell.addServiceLabel.textColor = [UIColor orangeColor];
            
            return infoZeroCell;
            
        } else {
            
            APAddServiceCell* addServiceCell = [tableView dequeueReusableCellWithIdentifier:addServiceIdentifier];
        
            addServiceCell.addServiceLabel.text = @"+ Добавить услуги";
            
            addServiceCell.addServiceLabel.textColor = [UIColor blueColor];
            
            return addServiceCell;
            
        }
    
    } else if (indexPath.section == 1 && indexPath.row <= [self.master.serviceKind count] - 1) {
        
        // serviceCell
        
        APServiceCell* serviceCell = [tableView dequeueReusableCellWithIdentifier:serviceIdentifier];
        
        NSString* serviceName = [self.master.serviceKind objectAtIndex:indexPath.row];
        
        serviceCell.serviceKindLabel.text = serviceName;
        
        NSString* serviceDurationInMinutesString = (NSString*)[self.master.serviceDuration objectAtIndex:indexPath.row];
        
        NSInteger serviceDurationInMinutes = [serviceDurationInMinutesString integerValue];
        
        // время в минутах.
        
        NSString* serviceDuration;
        
        CGFloat serviceDurationInHours;
        
        if (serviceDurationInMinutes >= 60) {
            
            serviceDurationInHours = ((float)serviceDurationInMinutes / 60);

            serviceDuration = [NSString stringWithFormat:@"%.1f часа", serviceDurationInHours];
            
        } else {
            
            serviceDuration = [NSString stringWithFormat:@"%ld минут", (long)serviceDurationInMinutes];
            
        }
        
        
        NSInteger serviceCost = [[self.master.serviceCost objectAtIndex:indexPath.row] integerValue];
        
        serviceCell.durationAndCostLabel.text = [NSString stringWithFormat:@"%@, %ld руб.", serviceDuration, (long)serviceCost];
        
//        serviceCell.deleteServiceView.image = [UIImage imageNamed:@"deleteIcon.png"];
        
        return serviceCell;
        
    } else if (indexPath.section == 2) {
        
        // clientCell
        
        APClientCell* clientCell = [tableView dequeueReusableCellWithIdentifier:clientIdentifier];
        
        NSString* clientInitials = [self.master.clientBase objectAtIndex:indexPath.row];
        
        clientCell.clientInitialsLabel.text = clientInitials;
        
        return clientCell;
        
    }
    
    
    return nil;
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        height = 80.f;
        
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        
        height = 45.f;
        
    } else if (indexPath.section == 1) {
        
        height = 75.f;
        
    } else {
        
        height = 45.f;
        
    }
    
    return height;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [self.master.serviceKind count] && indexPath.section == 1) {
        
        //ПОПОВЕР ДОБАВЛЕНИЕ УСЛУГИ
        
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        APPopoverController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"APPopoverController"];
        
        vc.delegate = self;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            // поповер для Ipad
            
            UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
            
            [popover presentPopoverFromRect:cell.contentView.frame inView:cell.contentView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            
        } else {
            // Iphone
            
            [self presentViewController:vc animated:YES completion:nil];
            
        }

        
        
    }
    
    
    
}

#pragma mark - Actions

- (IBAction)writeToMasterAction:(UIButton *)sender {
    
    NSLog(@"writeToMasterAction");
    
}

- (IBAction)deleteServiceAction:(UIButton *)sender {
    
    APServiceCell* cell = [sender superCell];
    
    NSLog(@"услуга - %@, время и цена - %@", cell.serviceKindLabel.text, cell.durationAndCostLabel.text);
    
    self.deletingServiceIndexPath = [self.tableView indexPathForCell:cell];
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Удалить услугу"
                               message:@"Вы уверены, что хотите удалить услугу?"
                              delegate:nil
                      cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    
    alertView.delegate = self;
    
    [alertView show];
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
        // удаление
        [self.master.serviceKind removeObjectAtIndex:self.deletingServiceIndexPath.row];
        [self.master.serviceDuration removeObjectAtIndex:self.deletingServiceIndexPath.row];
        [self.master.serviceCost removeObjectAtIndex:self.deletingServiceIndexPath.row];
        
        // анимация
        [self.tableView beginUpdates];
        
        [self.tableView deleteRowsAtIndexPaths:@[self.deletingServiceIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        [self.tableView endUpdates];
        
        if ([self.master.serviceKind count] == 0) {
            
            [self.tableView reloadData];
            
        }
    
    }
    
}

#pragma mark - APServiceDataDelegate

- (void) sendServiceKind:(NSString*) serviceKind duration:(NSString*) duration andCost:(NSString*) cost {
    
    [self.master.serviceKind addObject:serviceKind];
    [self.master.serviceDuration addObject:duration];
    [self.master.serviceCost addObject:cost];
    
    [self.tableView reloadData];
    
}

@end

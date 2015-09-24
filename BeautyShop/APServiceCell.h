//
//  APServiceCell.h
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APServiceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serviceKindLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationAndCostLabel;

@end

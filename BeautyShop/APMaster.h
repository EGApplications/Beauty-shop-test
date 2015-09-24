//
//  APMaster.h
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMaster : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* surname;
@property (strong, nonatomic) NSMutableArray* clientBase;

// услуги мастера
@property (strong, nonatomic) NSMutableArray* serviceKind;
@property (strong, nonatomic) NSMutableArray* serviceDuration;
@property (strong, nonatomic) NSMutableArray* serviceCost;

@end

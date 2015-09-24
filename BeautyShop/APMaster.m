//
//  APMaster.m
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import "APMaster.h"

@interface APMaster()

@property (strong, nonatomic) NSArray* namesArray;
@property (strong, nonatomic) NSArray* surnamesArray;
@property (strong, nonatomic) NSArray* femaleNames;

@end

@implementation APMaster

- (instancetype)init

{
    self = [super init];
    
    if (self) {
        
        self.serviceKind = [NSMutableArray array];
        self.serviceDuration = [NSMutableArray array];
        self.serviceCost = [NSMutableArray array];
        self.clientBase = [NSMutableArray array];
        
        // Сделаем 5 клиентов каждому мастеру
        
        for (int i = 1; i <= 5; i++) {
        
        self.namesArray = [NSArray array];
        self.surnamesArray = [NSArray array];
        self.femaleNames = [NSArray array];
        
        // Все имена
        self.namesArray = [NSArray arrayWithObjects:@"Robert", @"David", @"Jack", @"John", @"Vince", @"James", @"Anthony", @"Tony", @"Patrick", @"Tom", @"Brad", @"Finn", @"Fred", @"Wes", @"Sam", @"Steve", @"Bruce", @"Chris", @"Bobby", @"Terry", @"Jeff", @"Sterling", @"Lisa", @"Joanna", @"Kira", @"Annie", @"Monica", @"Rebecca", @"Jenny", @"Sandra", @"Nicole", @"Victoria", @"Mary", @"Marina", @"Vanessa", @"Christie", @"Anna", @"Nina", @"Polina", @"Klara", nil];
        
        // Женские имена
        self.femaleNames = [NSArray arrayWithObjects:@"Lisa", @"Joanna", @"Kira", @"Annie", @"Monica", @"Rebecca", @"Jenny", @"Sandra", @"Nicole", @"Victoria", @"Mary", @"Marina", @"Vanessa", @"Christie", @"Anna", @"Nina", @"Polina", @"Klara", nil];
        
        NSString* clientName = [NSString stringWithFormat:@"%@", [self.namesArray objectAtIndex:arc4random_uniform((int)[self.namesArray count])]];
        
        self.surnamesArray = [NSArray arrayWithObjects:@"De Niro", @"Beckham", @"Travolta", @"Monaghan", @"Bond", @"Hopkins", @"Stark", @"Swasey", @"Hanks", @"Pitt", @"Brown", @"Durst", @"Borland", @"Rivers", @"Rogers", @"Willis", @"Hamswort", @"Labonte", @"O`Quinn", @"Bridges", @"Marlen", @"Freeman", @"Ford", @"Allen", @"Norton", @"Catch", @"Wildmore", @"Davidson", @"Will", @"Potter", @"Wesley", @"Parker", @"Marsh", @"Broflovski", @"Cartman", @"Linder", @"Walker", @"Diesel", @"McFly", nil];
        
        NSString* clientSurname = [NSString stringWithFormat:@"%@", [self.surnamesArray objectAtIndex:arc4random_uniform((int)[self.surnamesArray count])]];
        
            NSString* clientInitials = [NSString stringWithFormat:@"%@ %@", clientName, clientSurname];
            
            [self.clientBase addObject:clientInitials];
            
        }
        
    }
    
    return self;
    
}

@end

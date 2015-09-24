//
//  UIView+APServiceCell.m
//  BeautyShop
//
//  Created by Евгений Глухов on 24.09.15.
//  Copyright (c) 2015 Evgeny Glukhov. All rights reserved.
//

#import "UIView+APServiceCell.h"

@implementation UIView (APServiceCell)

- (APServiceCell*) superCell {
    
    if ([self isKindOfClass:[APServiceCell class]]) {
        
        return (APServiceCell*)self;
        
    }
    
    if (!self.superview) {
        
        return nil;
        
    }
    
    return [self.superview superCell];
    
}

@end

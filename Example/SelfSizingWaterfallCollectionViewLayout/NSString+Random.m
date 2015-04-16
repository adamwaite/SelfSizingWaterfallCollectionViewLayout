//
//  NSString+Random.m
//  SelfSizingWaterfallCollectionViewLayout
//
//  Created by Adam Waite on 01/10/2014.
//  Copyright (c) 2014 adamjwaite.co.uk. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (instancetype)random
{
    NSMutableString *string = [NSMutableString string];
    int stringLength = (arc4random() % 100) + 50;
    for (int i = 0; i < stringLength; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}

@end

//
//  WordCollectionViewCell.m
//  SelfSizingWaterfallCollectionViewLayout
//
//  Created by Adam Waite on 01/10/2014.
//  Copyright (c) 2014 adamjwaite.co.uk. All rights reserved.
//

#import "WordCollectionViewCell.h"

@implementation WordCollectionViewCell

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    self.label.preferredMaxLayoutWidth = layoutAttributes.size.width - 16.0f;
    UICollectionViewLayoutAttributes *preferredAttributes = [layoutAttributes copy];
    preferredAttributes.size = CGSizeMake(layoutAttributes.size.width, self.label.intrinsicContentSize.height + 16.0f);
    return preferredAttributes;
}

@end
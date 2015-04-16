//
//  ViewController.m
//  SelfSizingWaterfallCollectionViewLayout
//
//  Created by Adam Waite on 01/10/2014.
//  Copyright (c) 2014 adamjwaite.co.uk. All rights reserved.
//

#import "ViewController.h"
#import "SelfSizingWaterfallCollectionViewLayout.h"
#import "NSString+Random.h"
#import "WordCollectionViewHeader.h"
#import "WordCollectionViewCell.h"

@interface ViewController () <SelfSizingWaterfallCollectionViewLayoutDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *cellData;
@end

@implementation ViewController

#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"WordCollectionViewHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WordHeader"];
    self.cellData = [NSMutableArray array];
    [self refresh:nil];
}

#pragma mark Cell Data

- (IBAction)refresh:(id)sender
{
    NSUInteger randomNumberOfSections =  (arc4random() % 10) + 1;
    
    for (NSUInteger sectIdx = 0; sectIdx < randomNumberOfSections; sectIdx++) {
        
        self.cellData[sectIdx] = [NSMutableArray array];
        
        NSUInteger randomNumberOfItems = (arc4random() % 21) + 1;
        for (NSUInteger itemIdx = 0; itemIdx < randomNumberOfItems; itemIdx++) {
            [self.cellData[sectIdx] addObject:[NSString random]];
        }
    }
    
    [self.collectionView reloadData];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    [self.collectionView reloadData];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.cellData.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.cellData[section] count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    WordCollectionViewHeader *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WordHeader" forIndexPath:indexPath];
    reusableView.label.text = [NSString stringWithFormat:@"Section %@", @(indexPath.section + 1)];
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WordCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WordCell" forIndexPath:indexPath];
    cell.label.text = self.cellData[indexPath.section][indexPath.item];
    return cell;
}

#pragma mark SelfSizingWaterfallCollectionViewLayoutDelegate

- (NSUInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout numberOfColumnsInSection:(NSUInteger)section
{
    NSUInteger compactColumns = 2;
    
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        return compactColumns + 1;
    }
    
    return compactColumns;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout estimatedHeightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSUInteger)section
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 80.0f);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(16.0f, 16.0f, 16.0f, 16.0f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 8.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 8.0f;
}

@end

//
//  LMSCell.h
//  Buoy Buddy
//
//  Created by Luca Spinazzola on 12/12/13.
//  Copyright (c) 2013 ITP Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSCell : UICollectionViewCell
@property (nonatomic) IBOutlet UILabel* cellLabel;
- (void) setText:(NSString*) cellText;

@end

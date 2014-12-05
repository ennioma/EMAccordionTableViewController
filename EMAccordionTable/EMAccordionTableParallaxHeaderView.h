//
//  EMAccordionTableParallaxHeaderView.h
//  EMAccordionTableViewController
//
//  Created by Ennio Masi on 04/12/14.
//  Copyright (c) 2014 EM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMAccordionTableParallaxHeaderView : UIView

@property (nonatomic, strong) UIImage *headerImage;

- (void) updateLayout: (UIScrollView *)scrollView;

@end

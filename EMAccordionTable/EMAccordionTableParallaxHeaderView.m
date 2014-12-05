//
//  EMAccordionTableParallaxHeaderView.m
//  EMAccordionTableViewController
//
//  Created by Ennio Masi on 04/12/14.
//  Copyright (c) 2014 EM. All rights reserved.
//

#import "EMAccordionTableParallaxHeaderView.h"
#import "UIImage+ImageEffects.h"

#define kHeaderMaxOffset 10.0f;

@implementation EMAccordionTableParallaxHeaderView {
    UIImageView *headerIV;

    CGRect originalHeaderViewRect;
    UIImage *originalImage;
    UIImageView *blurredHeaderImageView;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setupView];
    
    return self;
}

- (void) setupView {
    headerIV = [[UIImageView alloc] initWithFrame:self.bounds];
    headerIV.contentMode = UIViewContentModeScaleAspectFill;
    headerIV.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    originalHeaderViewRect = headerIV.frame;
    
    blurredHeaderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, headerIV.bounds.size.width, headerIV.bounds.size.height)];
    blurredHeaderImageView.alpha = 0.0f;
    blurredHeaderImageView.clipsToBounds = YES;
    blurredHeaderImageView.autoresizingMask = headerIV.autoresizingMask;
    
    [headerIV addSubview:blurredHeaderImageView];
    [self addSubview:headerIV];
}

- (void) setHeaderImage:(UIImage *)headerImage {
    originalImage = headerImage;
    headerIV.image = headerImage;

    blurredHeaderImageView.image = [self applyBlur];
}

- (void) updateLayout: (UIScrollView *)scrollView {
    if (scrollView.contentOffset.y == 0) {
        headerIV.frame = originalHeaderViewRect;
    } else if (scrollView.contentOffset.y < 0) {
        CGRect rectToUpdate = originalHeaderViewRect;

        CGFloat offset = MAX(-originalHeaderViewRect.size.height, scrollView.contentOffset.y);
        rectToUpdate.origin.y = originalHeaderViewRect.origin.y + offset;
        rectToUpdate.size.height = originalHeaderViewRect.size.height - offset;
        headerIV.frame = rectToUpdate;
    } else {
        CGRect rectToUpdate = originalHeaderViewRect;
        
        CGFloat offset = MIN(originalHeaderViewRect.size.height, scrollView.contentOffset.y);
        rectToUpdate.origin.y = originalHeaderViewRect.origin.y - offset;
        rectToUpdate.size.height = originalHeaderViewRect.size.height + offset;

        headerIV.frame = rectToUpdate;
    }
    
    blurredHeaderImageView.alpha = scrollView.contentOffset.y / originalHeaderViewRect.size.height;
}

- (UIImage *)applyBlur {
    blurredHeaderImageView.image = originalImage;
    return [blurredHeaderImageView.image applyBlurWithRadius:5 tintColor:[UIColor colorWithWhite:0.6 alpha:0.2] saturationDeltaFactor:1.0 maskImage:nil];
}

@end

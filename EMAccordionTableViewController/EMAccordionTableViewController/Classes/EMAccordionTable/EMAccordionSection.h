//
//  EMAccordionSection.h
//  UChat
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 Hippocrates Sintech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMAccordionSection : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIImage *rightArrow;
@property (nonatomic, strong) UIImage *downArrow;
@property (nonatomic) NSInteger numberOfItems;

@end

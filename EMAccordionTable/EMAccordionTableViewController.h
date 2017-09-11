//
//  EMAccordionTableViewController.h
//  UChat
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 Hippocrates Sintech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EMAccordionSection.h"
#import "EMAccordionTableParallaxHeaderView.h"

typedef NS_ENUM(NSUInteger, EMAnimationType) {
    EMAnimationTypeNone,
    EMAnimationTypeBounce,
};

@protocol EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (void) latestSectionOpened;
@end

@interface EMAccordionTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImage * closedSectionIcon;
@property (nonatomic, strong) UIImage * openedSectionIcon;
@property (nonatomic, strong) UIImage * discountSectionIcon;
@property (nonatomic, strong) UIImage * newdSectionIcon;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) EMAccordionTableParallaxHeaderView *parallaxHeaderView;
@property (nonatomic, strong) NSMutableArray *sectionsHeaders;
@property (nonatomic) NSInteger defaultOpenedSection;
@property (nonatomic, strong) NSNumber*isArabic;

- (id) initWithTable:(UITableView *)tableView withAnimationType:(EMAnimationType) type;

- (void) addAccordionSection: (EMAccordionSection *) section initiallyOpened:(BOOL)opened;
- (void) setDelegate: (NSObject <EMAccordionTableDelegate> *) delegate;
-(void)removeAllSections;
@end

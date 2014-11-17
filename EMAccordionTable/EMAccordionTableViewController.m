//
//  EMAccordionTableViewController.m
//  UChat
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 Hippocrates Sintech. All rights reserved.
//

#import "EMAccordionTableViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kSectionTag 1110

@interface EMAccordionTableViewController () {
    UITableViewStyle emTableStyle;
    
    NSMutableArray *sections;
    NSMutableArray *sectionsOpened;
    
    NSObject <EMAccordionTableDelegate> *emDelegate;
    
    NSUInteger openedSection;
    EMAnimationType animationType;
}

@end

@implementation EMAccordionTableViewController

@synthesize closedSectionIcon = _closedSectionIcon;
@synthesize openedSectionIcon = _openedSectionIcon;
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Exposed Methods
- (void) setEmTableView:(UITableView *)tv {
    self.view = [[UIView alloc] initWithFrame:tv.frame];
    
    _tableView = tv;
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    
    [self.view addSubview:_tableView];
}

- (id) initWithTable:(UITableView *)tableView withAnimationType:(EMAnimationType) type {
    if (self = [super init]) {
        self.view = [[UIView alloc] initWithFrame:tableView.frame];
        
        _tableView = tableView;
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        
        animationType = type;
        sections = [[NSMutableArray alloc] initWithCapacity:0];
        sectionsOpened = [[NSMutableArray alloc] initWithCapacity:0];
        openedSection = -1;
    }
    
    return self;
}

- (void) setDelegate: (NSObject <EMAccordionTableDelegate> *) delegate {
    emDelegate = delegate;
}

- (void) addAccordionSection: (EMAccordionSection *) section {
    [sections addObject:section];
    [sectionsOpened addObject:[NSNumber numberWithInt:0]];
}

#pragma mark UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return sections.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    EMAccordionSection *emSection = [sections objectAtIndex:section];
    BOOL value = [[sectionsOpened objectAtIndex:section] boolValue];
    
    if (value)
        return emSection.items.count;
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([emDelegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)])
        return [emDelegate tableView:tableView cellForRowAtIndexPath:indexPath];
    else
        [NSException raise:@"The delegate doesn't respond tableView:cellForRowAtIndexPath:" format:@"The delegate doesn't respond tableView:cellForRowAtIndexPath:"];
    
    return NULL;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == openedSection && animationType != EMAnimationTypeNone) {
        CGPoint offsetPositioning = CGPointMake(cell.frame.size.width / 2.0f, 20.0f);
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
        
        UIView *card = (UITableViewCell * )cell ;
        card.layer.transform = transform;
        
        card.layer.opacity = 0.5;
        
        [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.2f initialSpringVelocity:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            card.layer.transform = CATransform3DIdentity;
            card.layer.opacity = 1;
        } completion:NULL];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([emDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
        return [emDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    else
        [NSException raise:@"The delegate doesn't respond tableView:didSelectRowAtIndexPath:" format:@"The delegate doesn't respond tableView:didSelectRowAtIndexPath:"];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return tableView.sectionHeaderHeight;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    EMAccordionSection *emAccordionSection = [sections objectAtIndex:section];
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, tableView.sectionHeaderHeight)];
    [sectionView setBackgroundColor:emAccordionSection.backgroundColor];
    
    UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, sectionView.bounds.size.width, sectionView.bounds.size.height)];
    [sectionBtn addTarget:self action:@selector(openTheSection:) forControlEvents:UIControlEventTouchDown];
    [sectionBtn setTag:(kSectionTag + section)];
    [sectionView addSubview:sectionBtn];
    
    UILabel *cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, self.tableView.frame.size.width - 50.0f, sectionView.bounds.size.height)];
    [cellTitle setText:emAccordionSection.title];
    [cellTitle setTextColor:emAccordionSection.titleColor];
    [cellTitle setBackgroundColor:[UIColor clearColor]];
    [sectionView addSubview:cellTitle];
    
    UIImageView *accessoryIV = [[UIImageView alloc] initWithFrame:CGRectMake(sectionView.frame.size.width - 40.0f, (sectionView.frame.size.height / 2) - 15.0f, 30.0f, 30.0f)];
    BOOL value = [[sectionsOpened objectAtIndex:section] boolValue];
    [accessoryIV setBackgroundColor:[UIColor clearColor]];
    if (value)
        [accessoryIV setImage:self.openedSectionIcon];
    else
        [accessoryIV setImage:self.closedSectionIcon];
    
    [sectionView addSubview:accessoryIV];
    
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([emDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
        return [emDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    else
        [NSException raise:@"The delegate doesn't respond ew:heightForRowAtIndexP:" format:@"The delegate doesn't respond ew:heightForRowAtIndexP:"];
    
    return 0.0;
}


- (IBAction)openTheSection:(id)sender {
    int index = (int)[sender tag] - kSectionTag;
    
    BOOL value = [[sectionsOpened objectAtIndex:index] boolValue];
    NSNumber *updatedValue = [NSNumber numberWithBool:!value];
    
    [sectionsOpened setObject:updatedValue atIndexedSubscript:index];
    
    openedSection = index;

    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
//
//  EMAccordionTableViewController.m
//  UChat
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 Hippocrates Sintech. All rights reserved.
//

#import "EMAccordionTableViewController.h"

#define kSectionTag 1110

@interface EMAccordionTableViewController () {
    UITableView *emTableView;
    CGRect emTableFrame;
    CGFloat headerHeight;
    CGFloat rowHeight;
    UITableViewStyle emTableStyle;
    
    NSMutableArray *sections;
    NSMutableArray *sectionsOpened;
    
    NSObject <EMAccordionTableDelegate> *emDelegate;
}

@end

@implementation EMAccordionTableViewController

@synthesize closedSectionIcon = _closedSectionIcon;
@synthesize openedSectionIcon = _openedSectionIcon;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:emTableFrame];
    emTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:emTableStyle];
    [emTableView setDataSource:self];
    [emTableView setDelegate:self];
    [emTableView setRowHeight:rowHeight];
    
    [self.view addSubview:emTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Exposed Methods
- (id)initWithTableFrame:(CGRect) frame style:(UITableViewStyle)tableStyle {
    if (self = [super init]) {
        emTableFrame = frame;
        emTableStyle = tableStyle;
        
        sections = [[NSMutableArray alloc] initWithCapacity:0];
        sectionsOpened = [[NSMutableArray alloc] initWithCapacity:0];
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

- (void) setHeaderHeight:(CGFloat)height {
    headerHeight = height;
}

- (void) setRowHeight:(CGFloat)height {
    rowHeight = height;
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
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([emDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
        return [emDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    else
        [NSException raise:@"The delegate doesn't respond tableView:didSelectRowAtIndexPath:" format:@"The delegate doesn't respond tableView:didSelectRowAtIndexPath:"];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return headerHeight;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    EMAccordionSection *emAccordionSection = [sections objectAtIndex:section];
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, emTableFrame.size.width, headerHeight)];
    [sectionView setBackgroundColor:emAccordionSection.backgroundColor];
    
    UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, sectionView.bounds.size.width, sectionView.bounds.size.height)];
    [sectionBtn addTarget:self action:@selector(openTheSection:) forControlEvents:UIControlEventTouchDown];
    [sectionBtn setTag:(kSectionTag + section)];
    [sectionView addSubview:sectionBtn];
    
    UILabel *cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, emTableFrame.size.width - 50.0f, sectionView.bounds.size.height)];
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

- (IBAction)openTheSection:(id)sender {
    int index = [sender tag] - kSectionTag;
    
    NSLog(@"Reload the section at index %d", index);
    BOOL value = [[sectionsOpened objectAtIndex:index] boolValue];
    NSNumber *updatedValue = [NSNumber numberWithBool:!value];
    
    [sectionsOpened setObject:updatedValue atIndexedSubscript:index];
    
    [emTableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
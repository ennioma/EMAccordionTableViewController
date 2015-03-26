//
//  ViewController.m
//  EMAccordionTableViewController
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 EM. All rights reserved.
//

#import "ViewController.h"

#define kTableHeaderHeight 80.0f
#define kTableRowHeight 40.0f

@interface ViewController () {
    EMAccordionTableViewController *emTV;
    EMAccordionTableParallaxHeaderView *emParallaxHeaderView;
}

@end

@implementation ViewController {
    NSMutableArray *dataSection01;
    NSMutableArray *dataSection02;
    NSMutableArray *dataSection03;
    NSMutableArray *dataSection04;
    NSMutableArray *dataSection05;
    NSMutableArray *dataSection06;
    NSMutableArray *dataSection07;
    
    NSArray *sections;
    CGFloat origin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    // Setup the EMAccordionTableViewController
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [tableView setSectionHeaderHeight:kTableHeaderHeight];
    /*
     ... set here some other tableView properties ...
     */
    
    // Setup the EMAccordionTableViewController
    emTV = [[EMAccordionTableViewController alloc] initWithTable:tableView withAnimationType:EMAnimationTypeBounce];
    [emTV setDelegate:self];
    emParallaxHeaderView = [[EMAccordionTableParallaxHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, tableView.bounds.size.width, 200.0f)];
    emParallaxHeaderView.headerImage = [UIImage imageNamed:@"naples"];
    emTV.parallaxHeaderView = emParallaxHeaderView;

    [emTV setClosedSectionIcon:[UIImage imageNamed:@"closedIcon"]];
    [emTV setOpenedSectionIcon:[UIImage imageNamed:@"openedIcon"]];
    
    // Setup some test data
    dataSection01 = [[NSMutableArray alloc] initWithObjects:@"Dog", @"Cat", @"Pig", nil];
    dataSection02 = [[NSMutableArray alloc] initWithObjects:@"Federer", @"Nadal", nil];
    dataSection03 = [[NSMutableArray alloc] initWithObjects:@"Naples", @"Genoa", @"New York", nil];
    dataSection04 = [[NSMutableArray alloc] initWithObjects:@"Adele", @"Arisa", @"Clementino", nil];
    dataSection05 = [[NSMutableArray alloc] initWithObjects:@"Red", @"Orange", @"Blue", @"Yello", @"Black", nil];
    dataSection06 = [[NSMutableArray alloc] initWithObjects:@"Italy", @"Spain", @"Ireland", @"Scotland", @"Poland", nil];
    dataSection07 = [[NSMutableArray alloc] initWithObjects:@"Pizza", @"Mozzarella", nil];
    //
    
    // Section graphics
    UIColor *sectionsColor = [UIColor colorWithRed:62.0f/255.0f green:119.0f/255.0f blue:190.0f/255.0f alpha:1.0f];
    UIColor *sectionTitleColor = [UIColor whiteColor];
    UIFont *sectionTitleFont = [UIFont fontWithName:@"Futura" size:24.0f];

    // Add the sections to the controller
    EMAccordionSection *section01 = [[EMAccordionSection alloc] init];
    [section01 setBackgroundColor:sectionsColor];
    [section01 setItems:dataSection01];
    [section01 setTitle:@"Animals"];
    [section01 setTitleFont:sectionTitleFont];
    [section01 setTitleColor:sectionTitleColor];
    [emTV addAccordionSection:section01];
    
    EMAccordionSection *section02 = [[EMAccordionSection alloc] init];
    [section02 setBackgroundColor:sectionsColor];
    [section02 setItems:dataSection02];
    [section02 setTitle:@"Tennis players"];
    [section02 setTitleColor:sectionTitleColor];
    [section02 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section02];
    
    EMAccordionSection *section03 = [[EMAccordionSection alloc] init];
    [section03 setBackgroundColor:sectionsColor];
    [section03 setItems:dataSection03];
    [section03 setTitle:@"Cities"];
    [section03 setTitleColor:sectionTitleColor];
    [section03 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section03];
    
    EMAccordionSection *section04 = [[EMAccordionSection alloc] init];
    [section04 setBackgroundColor:sectionsColor];
    [section04 setItems:dataSection04];
    [section04 setTitle:@"Singers"];
    [section04 setTitleColor:sectionTitleColor];
    [section04 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section04];
    
    EMAccordionSection *section05 = [[EMAccordionSection alloc] init];
    [section05 setBackgroundColor:sectionsColor];
    [section05 setItems:dataSection05];
    [section05 setTitle:@"Colors"];
    [section05 setTitleColor:sectionTitleColor];
    [section05 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section05];
    
    EMAccordionSection *section06 = [[EMAccordionSection alloc] init];
    [section06 setBackgroundColor:sectionsColor];
    [section06 setItems:dataSection06];
    [section06 setTitle:@"Nations"];
    [section06 setTitleColor:sectionTitleColor];
    [section06 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section06];
    
    EMAccordionSection *section07 = [[EMAccordionSection alloc] init];
    [section07 setBackgroundColor:sectionsColor];
    [section07 setItems:dataSection07];
    [section07 setTitle:@"Recipes"];
    [section07 setTitleColor:sectionTitleColor];
    [section07 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section07];
    
    sections = [[NSArray alloc] initWithObjects:section01, section02, section03, section04, section05, section06, section07, nil];
    
    [self.view addSubview:emTV.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"emCell"];

    NSMutableArray *items = [self dataFromIndexPath:indexPath];

    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, self.view.bounds.size.width - origin*2 - 10.0f, kTableRowHeight)];
    [titleLbl setFont:[UIFont fontWithName:@"DINAlternate-Bold" size:12.0f]];
    [titleLbl setText:[items objectAtIndex:indexPath.row]];
    [titleLbl setBackgroundColor:[UIColor clearColor]];
    
    [[cell contentView] addSubview:titleLbl];
    
    cell.alpha = 0.0f;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableRowHeight;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EMAccordionSection *section = [sections objectAtIndex:indexPath.section];
    NSMutableArray *items = [self dataFromIndexPath:indexPath];

    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Oh my!" message:[[NSString alloc] initWithFormat:@"%@ : %@", section.title, [items objectAtIndex:indexPath.row]] delegate:NULL cancelButtonTitle:NULL otherButtonTitles:@"OK", nil];
    [av show];
}

- (NSMutableArray *) dataFromIndexPath: (NSIndexPath *)indexPath {
    if (indexPath.section == 0)
        return dataSection01;
    else if (indexPath.section == 1)
        return dataSection02;
    else if (indexPath.section == 2)
        return dataSection03;
    else if (indexPath.section == 3)
        return dataSection04;
    else if (indexPath.section == 4)
        return dataSection05;
    else if (indexPath.section == 5)
        return dataSection06;
    else if (indexPath.section == 6)
        return dataSection07;
    return NULL;
}

@end
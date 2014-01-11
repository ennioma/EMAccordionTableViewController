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
}

@end

@implementation ViewController {
    NSMutableArray *dataSection01;
    NSMutableArray *dataSection02;
    
    NSArray *sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    // Setup the EMAccordionTableViewController
    emTV = [[EMAccordionTableViewController alloc] initWithTableFrame:CGRectMake(100.0f, 100.0f, self.view.bounds.size.width - 200.0f, self.view.bounds.size.height - 200.0f) style:UITableViewStylePlain];
    [emTV setRowHeight:kTableRowHeight];
    [emTV setHeaderHeight:kTableHeaderHeight];
    
    [emTV setClosedSectionIcon:[UIImage imageNamed:@"closedIcon"]];
    [emTV setOpenedSectionIcon:[UIImage imageNamed:@"openedIcon"]];
    
    // Setup some test data
    dataSection01 = [[NSMutableArray alloc] initWithObjects:@"Dog", @"Cat", @"Pig", nil];
    dataSection02 = [[NSMutableArray alloc] initWithObjects:@"Federer", @"Nadal", nil];
    //
    
    // Section graphics
    UIColor *sectionsColor = [UIColor colorWithRed:46.0f/255.0f green:61.0f/255.0f blue:5.0f/255.0f alpha:1.0f];
    UIFont *sectionTitleFont = [UIFont fontWithName:@"Futura" size:24.0f];

    // Add the sections to the controller
    EMAccordionSection *section01 = [[EMAccordionSection alloc] init];
    [section01 setBackgroundColor:sectionsColor];
    [section01 setItems:dataSection01];
    [section01 setTitle:@"Animals"];
    [section01 setTitleFont:sectionTitleFont];
    [section01 setTitleColor:[UIColor blackColor]];
    [emTV addAccordionSection:section01];
    
    EMAccordionSection *section02 = [[EMAccordionSection alloc] init];
    [section02 setBackgroundColor:sectionsColor];
    [section02 setItems:dataSection02];
    [section02 setTitle:@"Tennis players"];
    [section02 setTitleColor:[UIColor blackColor]];
    [section01 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section02];
    
    EMAccordionSection *section03 = [[EMAccordionSection alloc] init];
    [section03 setBackgroundColor:sectionsColor];
    [section03 setTitle:@"Buh!"];
    [section03 setTitleColor:[UIColor whiteColor]];
    [section01 setTitleFont:sectionTitleFont];
    [emTV addAccordionSection:section03];
    [emTV setDelegate:self];
    
    sections = [[NSArray alloc] initWithObjects:section01, section02, section03, nil];
    
    [self.view addSubview:emTV.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"emCell"];
    [cell setFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 80.0f)];
    
    NSMutableArray *items = [self dataFromIndexPath:indexPath];

    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, cell.contentView.frame.size.width - 10.0f, 80.0f)];
    [titleLbl setFont:[UIFont fontWithName:@"DINAlternate-Bold" size:12.0f]];
    [titleLbl setText:[items objectAtIndex:indexPath.row]];
    [titleLbl setBackgroundColor:[UIColor clearColor]];
    
    [[cell contentView] addSubview:titleLbl];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EMAccordionSection *section = [sections objectAtIndex:indexPath.row];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Oh my!" message:[[NSString alloc] initWithFormat:@"%@", section.title] delegate:NULL cancelButtonTitle:NULL otherButtonTitles:@"OK", nil];
    [av show];
}

- (NSMutableArray *) dataFromIndexPath: (NSIndexPath *)indexPath {
    if (indexPath.section == 0)
        return dataSection01;
    else
        return dataSection02;
}

@end
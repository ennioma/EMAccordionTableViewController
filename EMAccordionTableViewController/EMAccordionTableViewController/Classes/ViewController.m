//
//  ViewController.m
//  EMAccordionTableViewController
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 EM. All rights reserved.
//

#import "ViewController.h"

#define kTableHeaderHeight 100.0f
#define kTableRowHeight 60.0f

@interface ViewController () {
    EMAccordionTableViewController *emTV;
}

@end

@implementation ViewController {
    NSMutableArray *dataSection00;
    NSMutableArray *dataSection01;
    
    NSArray *sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    
    emTV = [[EMAccordionTableViewController alloc] initWithTableFrame:CGRectMake(100.0f, 100.0f, self.view.bounds.size.width - 200.0f, self.view.bounds.size.height - 200.0f) style:UITableViewStylePlain];
    [emTV setRowHeight:kTableRowHeight];
    [emTV setHeaderHeight:kTableHeaderHeight];
    
    // set test data
    dataSection00 = [[NSMutableArray alloc] initWithObjects:@"Dog", @"Cat", @"Pig", nil];
    dataSection01 = [[NSMutableArray alloc] initWithObjects:@"Federer", @"Nadal", nil];
    //
    
    //
    EMAccordionSection *section01 = [[EMAccordionSection alloc] init];
    [section01 setBackgroundColor:[UIColor greenColor]];
    [section01 setTitle:@"Animals"];
    [section01 setTitleColor:[UIColor blackColor]];
    [section01 setItems:dataSection00];
    [emTV addAccordionSection:section01];
    
    EMAccordionSection *section02 = [[EMAccordionSection alloc] init];
    [section02 setBackgroundColor:[UIColor yellowColor]];
    [section02 setTitle:@"Tennis players"];
    [section02 setTitleColor:[UIColor blackColor]];
    [section02 setItems:dataSection01];
    [emTV addAccordionSection:section02];
    
    EMAccordionSection *section03 = [[EMAccordionSection alloc] init];
    [section03 setBackgroundColor:[UIColor blueColor]];
    [section03 setTitle:@"Buh!"];
    [section03 setTitleColor:[UIColor whiteColor]];
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
        return dataSection00;
    else
        return dataSection01;
}

@end
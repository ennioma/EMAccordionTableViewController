//
//  ViewController.m
//  EMAccordionTableViewController
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 EM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    EMAccordionTableViewController *emTV;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    
    emTV = [[EMAccordionTableViewController alloc] initWithTableFrame:CGRectMake(100.0f, 100.0f, self.view.bounds.size.width - 200.0f, self.view.bounds.size.height - 200.0f) style:UITableViewStylePlain];
    
    //
    EMAccordionSection *section01 = [[EMAccordionSection alloc] init];
    [section01 setBackgroundColor:[UIColor greenColor]];
    [section01 setTitle:@"Sezione #1"];
    [section01 setTitleColor:[UIColor whiteColor]];
    [section01 setNumberOfItems:2];
    [emTV addAccordionSection:section01];
    
    EMAccordionSection *section02 = [[EMAccordionSection alloc] init];
    [section02 setBackgroundColor:[UIColor yellowColor]];
    [section02 setTitle:@"Sezione #2"];
    [section02 setTitleColor:[UIColor whiteColor]];
    [emTV addAccordionSection:section02];
    
    EMAccordionSection *section03 = [[EMAccordionSection alloc] init];
    [section03 setBackgroundColor:[UIColor blueColor]];
    [section03 setTitle:@"Sezione #3"];
    [section03 setTitleColor:[UIColor whiteColor]];
    [emTV addAccordionSection:section03];
    
    EMAccordionSection *section04 = [[EMAccordionSection alloc] init];
    [section04 setBackgroundColor:[UIColor brownColor]];
    [section04 setTitle:@"Sezione #4"];
    [section04 setTitleColor:[UIColor whiteColor]];
    [emTV addAccordionSection:section04];
    
    EMAccordionSection *section05 = [[EMAccordionSection alloc] init];
    [section05 setBackgroundColor:[UIColor purpleColor]];
    [section05 setTitle:@"Sezione #5"];
    [section05 setTitleColor:[UIColor whiteColor]];
    [emTV addAccordionSection:section05];
    
    [emTV setDelegate:self];
    
    [self.view addSubview:emTV.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"emCell"];
    [cell setFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 80.0f)];
    
    if (indexPath.row % 2 != 0)
        [[cell contentView] setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 0.0f, cell.contentView.frame.size.width - 10.0f, 80.0f)];
    [titleLbl setFont:[UIFont fontWithName:@"DINAlternate-Bold" size:12.0f]];
    [titleLbl setText:@"CIAO"];
    [titleLbl setBackgroundColor:[UIColor clearColor]];
    
    [[cell contentView] addSubview:titleLbl];
    
    return cell;
}

@end
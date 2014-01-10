//
//  EMAccordionTableViewController.h
//  UChat
//
//  Created by Ennio Masi on 10/01/14.
//  Copyright (c) 2014 Hippocrates Sintech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EMAccordionSection.h"

@protocol EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface EMAccordionTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (id) initWithTableFrame:(CGRect) frame style:(UITableViewStyle)tableStyle;
- (void) addAccordionSection: (EMAccordionSection *) section;

- (void) setDelegate: (NSObject <EMAccordionTableDelegate> *) delegate;

@end
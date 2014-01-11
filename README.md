EMAccordionTableViewController
==============================
EMAccordionTableViewController is a easy to use Expandable / Collapsable UITableView for iOS. Under the hood it works as a proxy for the UITableView and leaves
to the delegate the responsability to implement tableView:cellForRowAtIndexPath and tableView:didSelectRowAtIndexPath.

* Built to be Universal
* Uses ARC (Automatic Reference Counting)
* Support iOS > 5.0
* Support rotation
* Completely reusable component

## How to install it?

Simply copy all the files included in the folder [EMAccordionTable](https://githubcom/ennioma/EMAccordionTableViewController/tree/master/EMAccordionTableViewController/EMAccordionTableViewController/Classes/EMAccordionTable) and start playing with it!

## How to use it?

### EMAccordionTableViewController Class

```objective-c
@interface EMAccordionTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImage * closedSectionIcon;
@property (nonatomic, strong) UIImage * openedSectionIcon;

- (id) initWithTableFrame:(CGRect) frame style:(UITableViewStyle)tableStyle;

- (void) addAccordionSection: (EMAccordionSection *) section;
- (void) setDelegate: (NSObject <EMAccordionTableDelegate> *) delegate;

- (void) setHeaderHeight:(CGFloat)height;
- (void) setRowHeight:(CGFloat)height;

@end
```
    
### EMAccordionTableDelegate Protocol

```objective-c
@protocol EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

```

### Example
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

## Help me improving this!
How? Simply feel free to fork the project and improve it!

If you would like to contact me:
Twitter: [ennioma](https://twitter.com/ennioma).
Email: ennio.masi@gmail.com
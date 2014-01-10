EMAccordionTableViewController
==============================
EMAccordionTableViewController is a easy to use Expandable / Collapsable UITableView for iOS. Under the hood it works as a proxy for the UITableView and leaves
to the delegate the responsability to implement tableView:cellForRowAtIndexPath and tableView:didSelectRowAtIndexPath.

* Reusable component
* Built Universal
* Uses ARC (Automatic Reference Counting)
* Support iOS > 5.0

## How to install it?

Simply fork the project and include the [EMAccordionTable](https://github.com/ennioma/EMAccordionTableViewController/tree/master/EMAccordionTableViewController/EMAccordionTableViewController/Classes/EMAccordionTable).

## How to use it?

### EMAccordionTableViewController Class

```objective-c
@interface EMAccordionTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

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
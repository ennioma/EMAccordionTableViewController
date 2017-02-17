EMAccordionTableViewController
==============================
[![N|Solid](https://github.com/ennioma/EMAccordionTableViewController/blob/master/EMAccordionTableViewControllerParallax.gif)](https://github.com/ennioma/EMAccordionTableViewController/blob/master/EMAccordionTableViewControllerParallax.gif)

EMAccordionTableViewController is a easy to use Expandable / Collapsable UITableView for iOS. Under the hood it works as a proxy for the UITableView and leaves
to the delegate the responsability to implement tableView:cellForRowAtIndexPath and tableView:didSelectRowAtIndexPath.

Update: Now it support the header view with parallax effect. I have used UIImage+ImageEffects from wwdc2013 to support the blur.

* Built to be Universal
* Support rotation
* Completely reusable component

## Apps that use the controller
* [my Soldier for Battlefield 4](https://itunes.apple.com/us/app/my-soldier-for-battlefield-4/id718845676)

## How to install it?
### CocoaPods
The recommended approach is to install `EMAccordionTableViewController` via [CocoaPods](http://cocoapods.org/).

``` bash
platform :ios, '6.0'
pod 'EMAccordionTableViewController', '~> 0.5.4'
```

And then install it running
``` bash
$ pod install
```

And now open the project in Xcode from the `.xcworkspace` file, not from the project file

``` bash
$ open YourOwnProject.xcworkspace
```

### Source Code
Alternatively you can just copy all the files included in the folder [EMAccordionTable](https://github.com/ennioma/EMAccordionTableViewController/tree/master/EMAccordionTable) and start playing with it!

## How it works?
### EMAccordionTableViewController Class

```objective-c
@interface EMAccordionTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImage * closedSectionIcon;
@property (nonatomic, strong) UIImage * openedSectionIcon;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) EMAccordionTableParallaxHeaderView *parallaxHeaderView;
@property (nonatomic, strong) NSMutableArray *sectionsHeaders;
@property (nonatomic) NSInteger defaultOpenedSection;

- (id) initWithTable:(UITableView *)tableView withAnimationType:(EMAnimationType) type;

- (void) addAccordionSection: (EMAccordionSection *) section initiallyOpened:(BOOL)opened;
- (void) setDelegate: (NSObject <EMAccordionTableDelegate> *) delegate;

@end
```

```objective-c
### EMAccordionTableDelegate Protocol
@protocol EMAccordionTableDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (void) latestSectionOpened;
@end
```

### EMAccordionSection Class
```objective-c
@interface EMAccordionSection : NSObject

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;

@end
```

## TODO
- Give the possibility to open a section clicking on the section itself instead of the icon
- Give the possibility to open a section programmatically

## Help me improving this!
How? Simply feel free to fork the project and improve it!

If you would like to contact me:
Twitter: [ennioma](https://twitter.com/ennioma).
Email: ennio.masi@gmail.com

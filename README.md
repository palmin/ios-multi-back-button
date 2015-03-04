# ios-multi-back-button

Replacement for the built-in UINavigationController back-button that allows going back multiple
levels. It requires iOS 8 as it uses popover presentation of view-controllers on iPhone.

Users long-tap the back-button to display a table with the viewControllers in the current navigation
stack. They either lift the finger and tap a table-cell or move it above the table and release above 
the cell for the view-controller you want to navigate to. If they do a regular tap, the back-button 
will bring you back a single level as usual.


  <img src="example.gif"/>
  

You configure a view-controller to use there buttons with some link like

````
#import "AB_MultiBackButtonItem.h"
 ⋮
- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureMultiBackButton];
    self.multiBackButtonImage = [UIImage imageNamed: @"myImage"];
}
````

You just need to include `AB_MultiBackButtonItem.h` and `AB_MultiBackButtonItem.m` in your project
and ``#import "AB_MultiBackButtonItem.h"``.

Because I have no reliable way to determine how much space is available in the navigation bar, the
back-button never shows the title of the previous view controller. I would much rather it included a title 
if there was sufficient space for this and you can find some traces of attempts at this. Suggestions on
how to do it are very welcome.

You can reach me as [@palmin](https://twitter.com/palmin) on Twitter

Environment
------
iOS7 & xcode5


Proble Description
------
Add scrollView on a view with UINavigationViewController, position of scrollView is misplaced.  
在有navigationController的时候，segue到detailView，detailView中添加的scrollView会被自动修改位置。

Solution One
------
1. Use "po [self.view recursiveDescription];" to show view hierarchy. Realize scrollView contentOffset is resized after viewDidLoad. Thus, to reset contentOffset to 0 could solve the proble.
```
- (void)viewDidLayoutSubviews {
    self.scrollView.contentOffset = CGPointZero;
}
```


Solution Two
------
1. Wondering how scrollView was resized. Found UIViewController has a new property automaticallyAdjustsScrollViewInsets. It will try to resize the scrollView to fit the screen. While in this case, it is not working properly. Thus, to solve the proble, simple set automaticallyAdjustsScrollViewInsets to no will solve the proble. 
2. Official ios document does not have enough explaination on automaticallyAdjustsScrollViewInsets. [Detailed explaination](http://stackoverflow.com/questions/18798792/explaining-difference-between-automaticallyadjustsscrollviewinsets-extendedlayo) from a stackoverflow user.
```
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
```


Reference
-----------------
- [iOS7 navigationController is setting the contentInset and ContentOffset of UIScrollView](http://stackoverflow.com/questions/18924431/ios-7-navigationcontroller-is-setting-the-contentinset-and-contentoffset-of-m) 
- [Working with UITableView in Xcode 5 Using Storyboard](http://www.appcoda.com/uitableview-tutorial-storyboard-xcode5)
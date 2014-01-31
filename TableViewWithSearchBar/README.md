Environment
------
iOS7 & xcode5


Notes
------
1. 实现普通的TableView步骤
 1. 添加控件
 2. 一个TableView控件不能光秃秃的，要有人来控制他。因而必须要有DataSource和Delegate，DataSource以用来显示数据，设置Delegate来响应手指的操作。该步骤用ctrl drag来设置。
 3. 根据UITableViewDataSource协议，有两个必须实现的方法numberofrowsInSection和cellForRowAtIndexPath
 4. 实现之前，要先声明，我要实现UITableViewDatasource和UITableViewDelegate协议（xcode5不声明也会正常运行）

2. 在TableView上加Search Bar and Search Display Controller
 1. 在TableView上，拖进Search Bar and Search Display控件，在左边栏中调整和cell的上下位置
 2. 在numberofrows和cellForRowAtIndexPath方法中，添加当前view是否为self.searchDisplayController.searchResultsTableView的if语句。其中self.searchDisplayController中的searchDisplayController为tableview自带属性，不用分别定义
 3. 实现searchDisplayController shouldReloadTableForSearchString方法
 4. 声明实现UISearchDisplayDelegate（xcode5不声明也会正常运行）


Reference
-----------------
- [UITableViewController Class Reference](https://developer.apple.com/library/ios/documentation/uikit/reference/UITableViewController_Class/Reference/Reference.html) 
- [Working with UITableView in Xcode 5 Using Storyboard](http://www.appcoda.com/uitableview-tutorial-storyboard-xcode5)

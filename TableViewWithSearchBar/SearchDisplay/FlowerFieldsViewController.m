//
//  FlowerFieldsViewController.m
//  SearchDisplay
//
//  Created by Ian on 2014/01/31.
//  Copyright (c) 2014年 com.yumemi.ian. All rights reserved.
//

#import "FlowerFieldsViewController.h"

@interface FlowerFieldsViewController ()
@property (nonatomic) NSArray *recipes;
@property (nonatomic) NSArray *searchResults;
@end

@implementation FlowerFieldsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 1. 实现普通的TableView。
    // TableView steps:
    // a 添加控件
    // b 一个TableView控件不能光秃秃的，要有人来控制他。因而必须要有DataSource和Delegate，DataSource以用来显示数据，设置Delegate来响应手指的操作
    //   用ctrl drag来设置
    // c 根据UITableViewDataSource协议，有两个必须实现的方法numberofrowsInSection和cellForRowAtIndexPath
    // d 实现之前，要先声明，我要实现UITableViewDatasource和UITableViewDelegate协议（xcode5不声明也会正常运行）
    // http://www.appcoda.com/uitableview-tutorial-storyboard-xcode5
    
    // 2. 在TableView上加Search Bar and Search Display Controller
    // a 在TableView上，拖进Search Bar and Search Display控件，在左边栏中调整和cell的上下位置
    // b 在numberofrows和cellForRowAtIndexPath方法中，添加当前view是否为self.searchDisplayController.searchResultsTableView的if语句
    //   其中self.searchDisplayController中的searchDisplayController为tableview自带属性，不用分别定义
    // c 实现searchDisplayController shouldReloadTableForSearchString方法
    // d 声明实现UISearchDisplayDelegate（xcode5不声明也会正常运行）
    
    self.recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*
	 If the requesting table view is the search display controller's table view, return the count of
     the filtered list, otherwise return the count of the main list.
	 */
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.searchResults count];
    }
	else
	{
        return [self.recipes count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }
	else
	{
        cell.textLabel.text = [self.recipes objectAtIndex:indexPath.row];
    }
    
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",searchText];
    self.searchResults = [self.recipes filteredArrayUsingPredicate:resultPredicate];
    //NSLog(@"%@",self.searchResults);
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    return YES;
}

@end

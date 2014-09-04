//
//  XYZViewController.m
//  autoLayoutAndStrollViewContentSize
//
//  Created by Ian on 2014/09/03.
//  Copyright (c) 2014年 com.flowerfields. All rights reserved.
//

#import "XYZViewController.h"
#import "XYZXibView.h"

@interface XYZViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property XYZXibView* xibView;
@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.xibView = [XYZXibView xibViewFromNib];
    
    [self.scrollView addSubview:self.xibView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)viewDidLayoutSubviews {
//    self.scrollView.contentOffset = CGPointZero;
}

// Two type of autolayout ?
// Disable?
//

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

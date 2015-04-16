//
//  detailViewController.m
//  retainCycle
//
//  Created by 戴 暁華 on 4/14/15.
//  Copyright (c) 2015 戴 暁華. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()
@property NSTimer *aTimer;
@end


@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startTimer];
}

-(void)startTimer {
    if ( self.aTimer ) {
        [self stopTimer];
    }
    self.aTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

-(void)stopTimer {
    if ( self.aTimer ) {
        [self.aTimer invalidate];
        self.aTimer = nil;
    }
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [self stopTimer];
//}

- (void) dealloc {
    [self stopTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tick:(NSTimer *)timer{
    NSLog(@"%@", @"some time");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

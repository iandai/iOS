//
//  XYZXibView.m
//  autoLayoutAndStrollViewContentSize
//
//  Created by Ian on 2014/09/03.
//  Copyright (c) 2014年 com.flowerfields. All rights reserved.
//

#import "XYZXibView.h"

@implementation XYZXibView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



+ (id)xibViewFromNib {
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:[NSBundle mainBundle]];
    NSArray *array = [nib instantiateWithOwner:self options:nil];
    
    return array[0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

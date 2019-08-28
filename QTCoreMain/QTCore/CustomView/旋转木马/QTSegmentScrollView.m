//
//  QTSegmentScrollView.m
//  QTCoreMain
//
//  Created by MasterBie on 2019/8/27.
//  Copyright © 2019 MasterBie. All rights reserved.
//

#import "QTSegmentScrollView.h"

@implementation QTSegmentScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer.state != 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end

//
//  UIView+Positioning.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "UIView+Positioning.h"

#define SCREEN_SCALE                    ([[UIScreen mainScreen] scale])
#define PIXEL_INTEGRAL(pointValue)      (round(pointValue * SCREEN_SCALE) / SCREEN_SCALE)

@implementation UIView (Positioning)
@dynamic x, y, width, height, origin, size;

// Setters
-(void)setX:(CGFloat)x{
    CGRect r        = self.frame;
    r.origin.x      = PIXEL_INTEGRAL(x);
    self.frame      = r;
}

-(void)setY:(CGFloat)y{
    CGRect r        = self.frame;
    r.origin.y      = PIXEL_INTEGRAL(y);
    self.frame      = r;
}

-(void)setWidth:(CGFloat)width{
    CGRect r        = self.frame;
    r.size.width    = PIXEL_INTEGRAL(width);
    self.frame      = r;
}

-(void)setHeight:(CGFloat)height{
    CGRect r        = self.frame;
    r.size.height   = PIXEL_INTEGRAL(height);
    self.frame      = r;
}

-(void)setOrigin:(CGPoint)origin{
    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    self.x = right - self.width;
}

-(void)setBottom:(CGFloat)bottom {
    self.y = bottom - self.height;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

// Getters
-(CGFloat)x{
    return CGRectGetMinX(self.frame);
}

-(CGFloat)y{
    return CGRectGetMinY(self.frame);
}

-(CGFloat)width{
    return CGRectGetWidth(self.frame);
}

-(CGFloat)height{
    return CGRectGetHeight(self.frame);
}

-(CGPoint)origin{
    return CGPointMake(self.x, self.y);
}

-(CGSize)size{
    return CGSizeMake(self.width, self.height);
}

-(CGFloat)right {
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

-(CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

-(CGFloat)centerY {
    return CGRectGetMidY(self.frame);;
}

-(UIView *)lastSubviewOnX{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];

        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;

        return outView;
    }

    return nil;
}

-(UIView *)lastSubviewOnY{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];

        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;

        return outView;
    }

    return nil;
}

// Methods
-(void)centerToParent{
    if(self.superview){
        switch ((NSInteger)([UIApplication sharedApplication].statusBarOrientation)){
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:{
                self.x  =   PIXEL_INTEGRAL((self.superview.height / 2.0) - (self.width / 2.0));
                self.y  =   PIXEL_INTEGRAL((self.superview.width / 2.0) - (self.height / 2.0));
                break;
            }
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:{
                self.x  =   PIXEL_INTEGRAL((self.superview.width / 2.0) - (self.width / 2.0));
                self.y  =   PIXEL_INTEGRAL((self.superview.height / 2.0) - (self.height / 2.0));
                break;
            }
        }
    }
}

@end


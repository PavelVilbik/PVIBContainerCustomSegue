//
//  ContainerCustomSegue.m
//  CustomContainerSegueTest
//
//  Created by Vilbik Pavel on 1.8.15.
//  Copyright (c) 2015 Vilbik Pavel. All rights reserved.
//

#import "PVIBContainerCustomSegue.h"

@implementation PVIBContainerCustomSegue

- (void)perform{
    
    if (self.useFirstChildViewConrollerAsCurrent) {
        self.currentContainerController = [[self.sourceViewController childViewControllers] firstObject];
    }
    
    PVIBTransitionAnimationBlock anumationBlock = [self animationBlockForType:self.animationType];
    anumationBlock(self.containerView, [self.currentContainerController view], [self.destinationViewController view], self.onlyRemoveCurrentViewController, ^{
        
        if (self.currentContainerController) {
            [self.currentContainerController willMoveToParentViewController:self.sourceViewController];
            [self.currentContainerController removeFromParentViewController];
        }
        if (!self.onlyRemoveCurrentViewController) {
            [self.sourceViewController addChildViewController:self.destinationViewController];
            [self.destinationViewController didMoveToParentViewController:self.sourceViewController];
        }
    });
    
}

- (PVIBTransitionAnimationBlock)animationBlockForType:(PVIBContainerCustomSegueAnimationType)animationType{
    switch (animationType) {
        case PVIBContainerCustomSegueAnimationTypeNone:             return [self animationBlockForNoneAnimationType];           break;
        case PVIBContainerCustomSegueAnimationTypeMoveToRight:      return [self animationBlockForMoveToRightAnimationType];    break;
        case PVIBContainerCustomSegueAnimationTypeMoveToLeft:       return [self animationBlockForMoveToLeftAnimationType];     break;
        case PVIBContainerCustomSegueAnimationTypeCoverFromLeft:    return [self animationBlockForCoverFromLeftAnimationType];  break;
        case PVIBContainerCustomSegueAnimationTypeCoverFromRight:   return [self animationBlockForCoverFromRightAnimationType]; break;
        case PVIBContainerCustomSegueAnimationTypeFade:             return [self animationBlockForFadeAnimationType];           break;
        case PVIBContainerCustomSegueAnimationTypeZoomIn:           return [self animationBlockForZoomInAnimationType];         break;
        case PVIBContainerCustomSegueAnimationTypeZoomOut:          return [self animationBlockForZoomOutAnimationType];        break;
        case PVIBContainerCustomSegueAnimationTypeCustom:           return [self animationBlockForCustomAnimationType];         break;
    }
}

- (PVIBTransitionAnimationBlock)animationBlockForNoneAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        toView.frame = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [fromView removeFromSuperview];
        if (complete) complete();
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForMoveToRightAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        CGRect endFrameForFromView = CGRectMake(-fromView.frame.size.width, 0, fromView.frame.size.width, fromView.frame.size.height);
        toView.frame = CGRectMake(superView.bounds.size.width, 0, superView.bounds.size.width, superView.bounds.size.height);
        CGRect endFrameForToView = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [UIView animateWithDuration:0.25 animations:^{
            fromView.frame = endFrameForFromView;
            toView.frame = endFrameForToView;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForMoveToLeftAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        CGRect endFrameForFromView = CGRectMake(fromView.frame.size.width, 0, fromView.frame.size.width, fromView.frame.size.height);
        toView.frame = CGRectMake(-superView.bounds.size.width, 0, superView.bounds.size.width, superView.bounds.size.height);
        CGRect endFrameForToView = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [UIView animateWithDuration:0.25 animations:^{
            fromView.frame = endFrameForFromView;
            toView.frame = endFrameForToView;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForCoverFromLeftAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        toView.frame = CGRectMake(superView.bounds.size.width, 0, superView.bounds.size.width, superView.bounds.size.height);
        CGRect endFrameForToView = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [UIView animateWithDuration:0.25 animations:^{
            toView.frame = endFrameForToView;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForCoverFromRightAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        toView.frame = CGRectMake(-superView.bounds.size.width, 0, superView.bounds.size.width, superView.bounds.size.height);
        CGRect endFrameForToView = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [UIView animateWithDuration:0.25 animations:^{
            toView.frame = endFrameForToView;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForFadeAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        toView.frame = superView.bounds;
        toView.alpha = 0.0;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [UIView animateWithDuration:0.25 animations:^{
            toView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForZoomInAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        CGRect endFrameFromView = CGRectMake(superView.frame.size.width / 2.0, superView.frame.size.height / 2.0, 0, 0);
        toView.frame = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView insertSubview:toView atIndex:0];
        
        [UIView animateWithDuration:0.25 animations:^{
            fromView.alpha = 0.0;
            fromView.frame = endFrameFromView;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForZoomOutAnimationType{
    return ^(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete){
        
        toView.frame = CGRectMake(superView.frame.size.width / 2.0, superView.frame.size.height / 2.0, 0, 0);
        toView.alpha = 0.0;
        CGRect endFrameToView = superView.bounds;
        if (!isOnlyRemoveViewAnimation) [superView addSubview:toView];
        
        [UIView animateWithDuration:0.25 animations:^{
            toView.alpha = 1.0;
            toView.frame = endFrameToView;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            if (complete) complete();
        }];
    };
}

- (PVIBTransitionAnimationBlock)animationBlockForCustomAnimationType{
    if (self.customAnimationBlock)
        return self.customAnimationBlock;
    
    return [self animationBlockForNoneAnimationType];
}

@end

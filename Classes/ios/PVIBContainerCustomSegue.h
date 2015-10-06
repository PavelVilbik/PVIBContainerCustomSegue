//
//  ContainerCustomSegue.h
//  CustomContainerSegueTest
//
//  Created by Vilbik Pavel on 1.8.15.
//  Copyright (c) 2015 Vilbik Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @typedef PVIBContainerCustomSegueAnimationType
 @abstract Different transition animation.

 @discussion Selected animation are performed when child view controller appears.

 */
typedef NS_OPTIONS(NSUInteger, PVIBContainerCustomSegueAnimationType) {
    /// New view controller appears without animation.
    PVIBContainerCustomSegueAnimationTypeNone,
    
    /// New view controller pushes old view controller to right.
    PVIBContainerCustomSegueAnimationTypeMoveToRight,
    
    /// New view controller pushes old view controller to left.
    PVIBContainerCustomSegueAnimationTypeMoveToLeft,
    
    /// New view controller covers old view controller from left to right.
    PVIBContainerCustomSegueAnimationTypeCoverFromLeft,
    
    /// New view controller covers old view controller from right to left.
    PVIBContainerCustomSegueAnimationTypeCoverFromRight,
    
    /// New view controller change alpha from 0.0 to 1.0.
    PVIBContainerCustomSegueAnimationTypeFade,
    
    /// Old view controller decrease frame size to center new view controller.
    PVIBContainerCustomSegueAnimationTypeZoomIn,
    
    /// New view controller appears from center old view controller.
    PVIBContainerCustomSegueAnimationTypeZoomOut,
    
    /// Performed custom animation from customAnimationBlock
    PVIBContainerCustomSegueAnimationTypeCustom
};


/*!
 @typedef PVIBAnimationComplete
 @abstract Block define finish transition animation.
 @discussion If you implement custom animation, you should call PVIBAnimationComplete block to finish transition.
 */
typedef void(^PVIBAnimationComplete)();


/*!
 @typedef PVIBTransitionAnimationBlock
 @abstract Define custom animation block for PVIBContainerCustomSegueAnimationTypeCustom.
 @param superView View of container view.
 @param fromView View of old view controller, which will remove.
 @param toView View of new view controller, which will add.
 @param isOnlyRemoveViewAnimation Value define, what new view controller won't add, but old view controller will remove.
 @param complete This block should be performed then animation complete.
 @discussion Implement this block if you need custom transition animation when new view controller change old. If you setup PVIBContainerCustomSegueAnimationTypeCustom and don’t implement customAnimationBlock, it will be as PVIBContainerCustomSegueAnimationTypeNone.
 */
typedef void(^PVIBTransitionAnimationBlock)(UIView *superView, UIView *fromView, UIView *toView, BOOL isOnlyRemoveViewAnimation, PVIBAnimationComplete complete);


/*!
 @class PVIBContainerCustomSegue
 @property containerView View which will contain new view controller’ view.
 @discussion This class implement custom segue and provide mechanism for switch between view controller. For example, you can use it for switching view controllers with UISegmentedControl. 
 */
@interface PVIBContainerCustomSegue : UIStoryboardSegue



/*!
 View which will contain new view controller’ view.
 */
@property (nonatomic, strong) UIView *containerView;


/*!
 Old view controller which will remove from child view controller.
 */
@property (nonatomic, strong) UIViewController *currentContainerController;

/*!
 Animation transition type.
 */
@property (nonatomic) PVIBContainerCustomSegueAnimationType animationType;

/*!
 Animation transition block for PVIBContainerCustomSegueAnimationTypeCustom.
 */
@property (nonatomic, strong) PVIBTransitionAnimationBlock customAnimationBlock;

/*!
 Set YES if you want only remove old view controller.
 */
@property (nonatomic) BOOL onlyRemoveCurrentViewController;

/*!
 Set YES if you want use first child view controller as old.
 */
@property (nonatomic) BOOL useFirstChildViewConrollerAsCurrent;

@end

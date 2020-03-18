//
//  UIViewController+RC_AlertAnimation.m
//  servicecloud
//
//  Created by Roy CHANG on 2020/3/13.
//  Copyright © 2020 Roy CHANG. All rights reserved.
//

#import "UIViewController+RC_AlertAnimation.h"

@implementation UIViewController (RC_AlertAnimation)

- (void)presentAlertController:(UIViewController<RC_AlertAnimationDelegate> *)alertController{
    
    NSAssert(alertController, @"the presented controller can not be nil.");
    if(!alertController){
        
        return;
    }
    
    alertController.transitioningDelegate = (id<UIViewControllerTransitioningDelegate>)self;
    alertController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    RC_AlertAnimation *animation = [RC_AlertAnimation rc_presentAnimation];
    animation.delegate = (id<RC_AlertAnimationDelegate>)presented;
    
    return animation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    RC_AlertAnimation *animation = [RC_AlertAnimation rc_dismissAnimation];
    animation.delegate = (id<RC_AlertAnimationDelegate>)dismissed;
    
    return animation;
}

@end

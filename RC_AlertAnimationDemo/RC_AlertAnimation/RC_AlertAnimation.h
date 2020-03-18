//
//  RC_AlertAnimation.h
//  servicecloud
//
//  Created by Roy CHANG on 2020/3/11.
//  Copyright © 2020 Roy CHANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewControllerTransitioning.h>

NS_ASSUME_NONNULL_BEGIN

@class RC_AlertAnimation;
@class UIViewController;
@protocol UIViewControllerAnimatedTransitioning;

@protocol RC_AlertAnimationDelegate <NSObject>

- (void)rc_presentAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler;

- (void)rc_dismissAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler;

@end

typedef NS_ENUM(NSInteger, RC_AlertAnimationType){
    
    RC_AlertAnimationType_Present,
    RC_AlertAnimationType_Dismiss
};

@interface RC_AlertAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<RC_AlertAnimationDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, readonly) RC_AlertAnimationType animationType;

@property (nonatomic, readonly, weak) UIViewController *from;
@property (nonatomic, readonly, weak) UIViewController *to;

+ (instancetype)rc_presentAnimation;

+ (instancetype)rc_dismissAnimation;

/**
    the default animation curve
    @discussion Instead of using the default animation curve, you can implement delegate to customize the animation. 'completionhandler' must be called once the 'delegate' is implemented.
    @param animations view's aniamiton, such as alpha, frame, transform...
 */
- (void)rc_animationWithBlock:(void(^)(void))animations;

@end

NS_ASSUME_NONNULL_END

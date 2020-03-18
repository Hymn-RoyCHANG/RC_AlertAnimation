//
//  RC_AlertAnimation.m
//  servicecloud
//
//  Created by Roy CHANG on 2020/3/11.
//  Copyright © 2020 Roy CHANG. All rights reserved.
//

#import "RC_AlertAnimation.h"

const CGFloat RC_AlertAnimation_SpringDuration = 0.4f;

@interface RC_AlertAnimation ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning> animationContext;

@end

@implementation RC_AlertAnimation

- (void)dealloc{
    
#if DEBUG
    NSLog(@"\nalert animation[%ld] dealloc\n", self.animationType);
#endif
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return self.duration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];
    
    _from = from;
    _to = to;
    _animationContext = transitionContext;
    
    switch(self.animationType){
            
        case RC_AlertAnimationType_Present:{
            
            if(self.delegate && [self.delegate respondsToSelector:@selector(rc_presentAnimation:completionHandler:)]){
                
                [[transitionContext containerView] addSubview:to.view];
                
                [self.delegate rc_presentAnimation:self completionHandler:^(BOOL finished) {
                    
                    [transitionContext completeTransition:(![transitionContext transitionWasCancelled] && finished)];
                }];
            }
        }
            break;
            
        case RC_AlertAnimationType_Dismiss:{
            
            if(self.delegate && [self.delegate respondsToSelector:@selector(rc_dismissAnimation:completionHandler:)]){
                
                [self.delegate rc_dismissAnimation:self completionHandler:^(BOOL finished) {
                    
                    [transitionContext completeTransition:(![transitionContext transitionWasCancelled] && finished)];
                }];
            }
        }break;
    }
}

- (instancetype)initWithAnimationType:(RC_AlertAnimationType)type duration:(NSTimeInterval)duration{
    
    if(self = [super init]){
        
        _animationType = type;
        self.duration = duration;
    }
    
    return self;
}

+ (instancetype)rc_presentAnimation{
    
    return [[self alloc] initWithAnimationType:RC_AlertAnimationType_Present duration:RC_AlertAnimation_SpringDuration];
}

+ (instancetype)rc_dismissAnimation{
    
    return [[self alloc] initWithAnimationType:RC_AlertAnimationType_Dismiss duration:RC_AlertAnimation_SpringDuration];
}

- (void)rc_animationWithBlock:(void(^)(void))animations{
    
    [UIView animateWithDuration:self.duration delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        if(animations){
            
            animations();
        }
    } completion:^(BOOL finished) {
        
        [self->_animationContext completeTransition:finished && ![self->_animationContext transitionWasCancelled]];
        ///self->_animationContext = nil;
    }];
}

@end

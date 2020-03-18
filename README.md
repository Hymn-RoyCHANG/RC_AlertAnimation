# RC_AlertAnimation
AlertController animation / 弹框动画 
# alert animation / 弹框动画
提供一个弹框的动画，对于动画的设置需要自行自定义控制器，然后实现代理：RC_AlertAnimationDelegate
```
#pragma mark - RC_AlertAnimationDelegate

- (void)rc_presentAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler{
    
    /// （1）using defualt animaiton curve / 使用默认动画曲线
    [animation rc_animationWithBlock:^{
        
        /// your animation here
        ...
    }];
    
    /// （2）or using your animation curve / 或者使用自己的动画
    [UIView animateWithDuration:duration animations:^{
        
        /// your animation here
        ...
    } completion:^(BOOL finished) {
        
        /// the comletionHanlder must be called / 自己定义动画曲线时，最后必须调用'comletionHanlder'
        completionHandler(finished);
    }];
}

- (void)rc_dismissAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler{
    
    [animation rc_animationWithBlock:^{
        
        /// your animation here
        ...
    }];
    
    /// ------
    
    [UIView animateWithDuration:duration animations:^{
        
        /// your animation here
        ...
    } completion:^(BOOL finished) {
        
        /// the comletionHanlder must be called.
        completionHandler(finished);
    }];
}
```

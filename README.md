# RC_AlertAnimation
AlertController animation / 弹框动画 
# alert animation / 弹框动画
提供一个弹框的动画，对于动画的设置需要自行自定义控制器，然后实现代理：RC_AlertAnimationDelegate
```objc
/// #1. declare AlertController / 定义AlertController
@interface MyAlertController : UIViewController <RC_AlertAnimationDelegate>
....
@end

@implementation MyAlertController

/// #2. init your subviews / 初始化子视图
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    .... your subviews ....
}

/// #3. implement delegate / 实现代理方法
#pragma mark - RC_AlertAnimationDelegate

- (void)rc_presentAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler{
    
    /// （1）using defualt animaiton curve / 使用默认动画曲线
    [animation rc_animationWithBlock:^{
        
        /// your animation here
        ...
    }];
    
    /// （2）or using your animation curve / 或者使用自己的动画曲线
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

@end

/// #4. present / 弹框
MyAlertController *alert = [[MyAlertController alloc] init];
[somevc presentAlertController:alert];
```

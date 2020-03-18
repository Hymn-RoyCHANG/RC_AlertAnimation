# RC_AlertAnimation
AlertController animation / 弹框动画 
# Sample Demo / 示例
这里是提供一个弹框动画，对于控制器的内容根据需求自行定义的，然后实现代理：RC_AlertAnimationDelegate 即可。

## Define AlertController / 定义AlertController
define the AlertController and implement the delegate / 定义AlertController并实现代理
```objc
@interface MyAlertController : UIViewController <RC_AlertAnimationDelegate>
....
@end

@implementation MyAlertController

/// init your subviews / 初始化子视图
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    .... your subviews ....
}

/// implement delegate / 实现代理方法
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
```

## Usage / 调用
```objc
MyAlertController *alert = [[MyAlertController alloc] init];
[somevc presentAlertController:alert];
```

//
//  Alert_1_ViewController.m
//  RC_AlertAnimationDemo
//
//  Created by Roy CHANG on 2020/3/18.
//  Copyright © 2020 Roy CHANG. All rights reserved.
//

#import "Alert_1_ViewController.h"

@interface Alert_1_ViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation Alert_1_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.3f];
    
    /// animation property
    self.view.alpha = 0.0f;
    self.contentView.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)rc_alert_1_dismissButtonEvent:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"'%@' has been dismissed", NSStringFromClass(self.class));
    }];
}

#pragma mark - implement animation delegate / 实现动画代理方法

#define ALERT_DEFAULT_CURVE_ENABLED 1
BOOL b_my_duration = YES;

- (void)rc_presentAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler{
    
    /// preference animation property / 动画前的预设置
    ///self.view.alpha = 0.0f;
    ///self.contentView.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    
#if ALERT_DEFAULT_CURVE_ENABLED
    /// using default animation curve / 使用默认动画曲线
    [animation rc_animationWithBlock:^{
        
        self.view.alpha = 1.0f;
        self.contentView.transform = CGAffineTransformIdentity;
    }];
#else
    /// using your animation
    ///animation.duration = 0.25f;
    CGFloat duration = b_my_duration ? 0.25f : animation.duration;
    [UIView animateWithDuration:duration animations:^{
        
        self.view.alpha = 1.0f;
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        /// the comletionHanlder must be called.
        completionHandler(finished);
    }];
#endif
}

- (void)rc_dismissAnimation:(RC_AlertAnimation *)animation completionHandler:(void (^)(BOOL finished))completionHandler{
    
#if ALERT_DEFAULT_CURVE_ENABLED
    [animation rc_animationWithBlock:^{
        
        self.view.alpha = 0.0f;
        self.contentView.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    }];
#else
    CGFloat duration = b_my_duration ? 0.25f : animation.duration;
    [UIView animateWithDuration:duration animations:^{
        
        self.view.alpha = 0.0f;
        self.contentView.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    } completion:^(BOOL finished) {
        
        /// the comletionHanlder must be called.
        completionHandler(finished);
    }];
#endif
}

@end

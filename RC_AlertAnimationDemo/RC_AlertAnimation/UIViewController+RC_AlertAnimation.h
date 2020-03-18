//
//  UIViewController+RC_AlertAnimation.h
//  servicecloud
//
//  Created by Roy CHANG on 2020/3/13.
//  Copyright © 2020 Roy CHANG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RC_AlertAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (RC_AlertAnimation)

- (void)presentAlertController:(UIViewController<RC_AlertAnimationDelegate> *)alertController;

@end

NS_ASSUME_NONNULL_END

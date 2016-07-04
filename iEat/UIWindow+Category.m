//
//  UIWindow+Category.m
//  zhiyou
//
//  Created by wave on 16/1/11.
//  Copyright © 2016年 Folse. All rights reserved.
//

#import "UIWindow+Category.h"
#import <SafariServices/SafariServices.h>

@implementation UIWindow (Category)

- (UIViewController *)topViewController {
    return [self __topViewControllerWithRootViewController:self.rootViewController];
}

- (UIViewController *)__topViewControllerWithRootViewController:(UIViewController *)rootViewController {
    // Handling UITabBarController
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *) rootViewController;
        return [self __topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *) rootViewController;
        return [self __topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self __topViewControllerWithRootViewController:presentedViewController];
    } else {
        for (UIView *view in [rootViewController.view subviews]) {
            id subViewController = [view nextResponder];    // Key property which most of us are unaware of / rarely use.
            if (subViewController && [subViewController isKindOfClass:[UIViewController class]]) {
                return [self __topViewControllerWithRootViewController:subViewController];
            }
        }
        return rootViewController;
    }
}

@end

@implementation UIApplication (URL)

- (void)zz_openURL:(NSURL *)URL {
    if (UIDevice.currentDevice.systemVersion.floatValue >= 9.0) {
        SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:URL];
        [[UIApplication sharedApplication].keyWindow.topViewController presentViewController:safariViewController animated:YES completion:nil];
    } else {
        [[UIApplication sharedApplication] openURL:URL];
    }
}

@end
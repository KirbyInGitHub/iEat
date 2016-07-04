//
//  UIWindow+Category.h
//  zhiyou
//
//  Created by wave on 16/1/11.
//  Copyright © 2016年 Folse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Category)

// 调用时有性能开销
@property(nonatomic, readonly, strong) UIViewController *topViewController;


@end

@interface UIApplication (URL)

- (void)zz_openURL:(NSURL *)URL;

@end

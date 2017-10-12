//
//  AppSingleton.m
//  MyWeather
//
//  Created by lijie on 2017/8/2.
//  Copyright © 2017年 lijie. All rights reserved.
//

#import "AppSingleton.h"

@implementation AppSingleton

+ (AppSingleton *)Instance {
    static AppSingleton *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[AppSingleton alloc] init];
    });
    return _instance;
}

/**
 *  获取APP BUILD
 */
- (NSString *)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *) kCFBundleVersionKey];
}

/**
 *  获取版本号+BUILD
 */

- (NSString *)versionBuild {
    NSString *version = [self clientVersion];
    NSString *build = [self build];
    
    NSString *versionBuild = [NSString stringWithFormat:@"v%@", version];
    
    if (![version isEqualToString:build]) {
        versionBuild = [NSString stringWithFormat:@"%@(%@)", versionBuild, build];
    }
    
    return versionBuild;
}

/**
 *  获取APP版本号
 *
 */
- (NSString *)clientVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

/**
 *  当前版本APP是否第一次运行
 *
 *  @return 如果当前版本是第一次运行则返回YES，否则则返回NO
 */
- (BOOL)isFirstRun {
    NSString *key = [@"HasLaunchedOnce" stringByAppendingString:[self versionBuild]];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:key]) {
        // app already launched
        return NO;
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // This is the first launch ever
        return YES;
    }
}


@end

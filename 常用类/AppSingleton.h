//
//  AppSingleton.h
//  MyWeather
//
//  Created by lijie on 2017/8/2.
//  Copyright © 2017年 lijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSingleton : NSObject

@property(readonly, copy, nonatomic) NSString *clientVersion;

+ (AppSingleton *)Instance;

/**
 *  客户端是否是第一次运行
 */
- (BOOL)isFirstRun;

@end

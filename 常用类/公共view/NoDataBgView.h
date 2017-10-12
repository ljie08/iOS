//
//  NoDataBgView.h
//  HappyMoment
//
//  Created by ljie on 2017/8/28.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoDataBgView : UIView

/**
 设置没有数据时的背景view
 
 @param hintStr 提示语
 */
- (void)setHintString:(NSString *)hintStr;

@end

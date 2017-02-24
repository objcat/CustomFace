//
//  ZYFaceHelper.h
//  自定义表情包
//
//  Created by 张祎 on 17/2/23.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FaceAttachment.h"

@interface ZYFaceHelper : NSObject
+ (void)insertFaceToString:(FaceAttachment *)model textView:(UITextView *)textView;
- (NSAttributedString *)faceWithServerString:(NSString *)string;
@end

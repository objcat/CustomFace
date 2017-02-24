//
//  ZYFaceBoard.h
//  自定义表情包
//
//  Created by 张祎 on 17/2/22.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYFaceBoardProtocol <NSObject>

- (void)zy_faceDidChanged:(NSAttributedString *)attributedString;

@end

@interface ZYFaceBoard : UIView
- (instancetype)initWithFrame:(CGRect)frame textView:(UITextView *)textView;

@property(nonatomic, assign) id <ZYFaceBoardProtocol> delegate;
@end

//
//  FaceItemCollectionViewCell.m
//  自定义表情包
//
//  Created by 张祎 on 17/2/22.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "FaceItemCollectionViewCell.h"

@implementation FaceItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.faceImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.faceImageView];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.faceImageView.frame = self.contentView.bounds;
}

@end

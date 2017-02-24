//
//  ZYFaceBoard.m
//  自定义表情包
//
//  Created by 张祎 on 17/2/22.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "ZYFaceBoard.h"
#import "FaceItemCollectionViewCell.h"
#import "FaceAttachment.h"
#import "ZYFaceHelper.h"

@interface ZYFaceBoard () <UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) NSMutableArray *faceArray;
@property(nonatomic, strong) UITextView *textView;
@end

@implementation ZYFaceBoard

- (NSMutableArray *)faceArray {
    if (!_faceArray) {
        _faceArray = [NSMutableArray array];
        
        NSArray *tagArr = @[@"[龇牙]", @"[吐舌]", @"[流汗]", @"[偷笑]", @"[再见]", @"[砸]", @"[擦汗]", @"[猪头]", @"[玫瑰]", @"[流泪]", @"[大哭]", @"[嘘]", @"[酷]", @"[抓狂]", @"[委屈]", @"[便便]", @"[地雷]", @"[菜刀]", @"[可爱]", @"[心心眼]", @"[害羞]", @"[帅气]", @"[吐]", @"[笑脸]", @"[生气]", @"[尴尬]", @"[惊吓]", @"[尴尬2]", @"[心]", @"[嘴唇]", @"[白眼]", @"[傲慢]", @"[难过]", @"[惊讶]", @"[疑问]", @"[睡觉]", @"[亲亲]", @"[憨笑]", @"[企鹅爱]", @"[衰]", @"[撇嘴]", @"[阴险]", @"[加油]", @"[发呆]", @"[睡着]", @"[抱抱]", @"[坏笑]", @"[飞吻]", @"[鄙视]", @"[晕]"];
        
        for (NSInteger i = 1; i < 51; i++) {
            FaceAttachment *faceAttachment = [[FaceAttachment alloc] init];
            faceAttachment.imageName = [NSString stringWithFormat:@"%03ld", i];
            faceAttachment.tagName = tagArr[i - 1];
            [_faceArray addObject:faceAttachment];
        }
    }
    return _faceArray;
}


- (instancetype)initWithFrame:(CGRect)frame textView:(UITextView *)textView {
    self = [super initWithFrame:frame];
    if (self) {
        
        _textView = textView;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 7, [UIScreen mainScreen].bounds.size.width / 7);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;

        self.collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor grayColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[FaceItemCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.faceArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FaceAttachment *faceAttachment = self.faceArray[indexPath.item];
    FaceItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    cell.faceImageView.image = [UIImage imageNamed:faceAttachment.imageName];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FaceAttachment *faceAttachment = self.faceArray[indexPath.item];
    //插入表情
    [ZYFaceHelper insertFaceToString:faceAttachment textView:self.textView];
    //插入表情代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(zy_faceDidChanged:)]) {
        [self.delegate zy_faceDidChanged:self.textView.attributedText];
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

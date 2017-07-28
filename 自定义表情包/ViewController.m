//
//  ViewController.m
//  自定义表情包
//
//  Created by 张祎 on 17/2/22.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "ViewController.h"
#import "ZYFaceBoard.h"
#import "NSAttributedString+zy_string.h"
#import "ZYFaceHelper.h"

@interface ViewController () <ZYFaceBoardProtocol, UITextViewDelegate>
@property(nonatomic, strong) ZYFaceBoard *faceBoard;
@property (strong, nonatomic) IBOutlet UIButton *faceButton;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextView *textView2;
@property(nonatomic, assign) BOOL keyBoardFlag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView.layer.borderWidth = 0.5;
    self.textView.delegate = self;
    
    self.textView2.layer.borderColor = [UIColor grayColor].CGColor;
    self.textView2.layer.borderWidth = 0.5;
    self.textView2.delegate = self;
    self.textView2.editable = NO;

    self.faceBoard = [[ZYFaceBoard alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250) textView:self.textView];
    self.faceBoard.backgroundColor = [UIColor redColor];
    self.faceBoard.delegate = self;

}

/** 下面输出的文字可用于上传服务器 */

//文字变化
- (void)textViewDidChange:(UITextView *)textView {
    
    //这个字符串可上传服务器
    NSString *serverString = [textView.attributedText toString];
    
    NSLog(@"传到服务器:%@", serverString);
    
//    //从服务器纯文本转换回来的表情富文本
//    NSAttributedString *converString = [[ZYFaceHelper new] faceWithServerString:serverString];
    
    //显示富文本
    self.textView2.text = serverString;
    
}

//表情变化
- (void)zy_faceDidChanged:(NSAttributedString *)attributedString {
    
    //这个字符串可上传服务器
    NSString *serverString = [self.textView.attributedText toString];
    
    NSLog(@"传到服务器:%@", serverString);
    
//    //从服务器纯文本转换回来的表情富文本
//    NSAttributedString *converString = [[ZYFaceHelper new] faceWithServerString:serverString];
//    
//    //显示富文本
    self.textView2.text = serverString;
}


- (IBAction)faceButton:(id)sender {
    
    if (!_keyBoardFlag) {
        
        [self.view endEditing:YES];
        self.textView.inputView = self.faceBoard;
        [self.textView becomeFirstResponder];
        [self.faceButton setImage:[UIImage imageNamed:@"键盘"] forState:UIControlStateNormal];
    }
    
    else {
        
        [self.view endEditing:YES];
        self.textView.inputView = nil;
        [self.textView becomeFirstResponder];
        [self.faceButton setImage:[UIImage imageNamed:@"表情"] forState:UIControlStateNormal];
    }
    
    _keyBoardFlag = !_keyBoardFlag;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  CombineTextViewViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/6.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineTextViewViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineTextViewViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, copy) NSString *content;

@end

@implementation CombineTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.content = @"在 TextView 中输入内容改变此内容";
    self.displayLabel.viewBind(self.content.bind,@"");
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    self.content.wrappedValue = [textView.text stringByReplacingCharactersInRange:range withString:text];
    return YES;
}


@end

//
//  CombineTextFiledViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/6.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineTextFiledViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineTextFiledViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, copy) NSString *inputText;

@end

@implementation CombineTextFiledViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputText = @"输入内容改变文本";
    self.displayLabel.viewBind(self.inputText.bind,@"");
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.inputText.wrappedValue = text;
    return YES;
}

@end

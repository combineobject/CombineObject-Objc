//
//  CombineViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/5.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineViewController ()
@property (weak, nonatomic) IBOutlet UIView *displayView;
/// 声明绑定属性
@property (nonatomic, strong) UIColor *displayViewBackgroundColor;
@property (weak, nonatomic) IBOutlet UILabel *displayColorText;

@end

@implementation CombineViewController

- (void)dealloc {
    NSLog(@"CombineViewController");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 初始化
    self.displayViewBackgroundColor = [UIColor grayColor];
    /// 绑定到试图默认的 BackgroundColor 属性
    self.displayView.viewBind(self.displayViewBackgroundColor.bind,@"");
    /// 绑定UILabel 的文本颜色
    self.displayColorText.viewBind(self.displayViewBackgroundColor.bind,UILabelIdentifier.textColor);
}
- (IBAction)changeWrappedValue:(id)sender {
    /// 更改属性的值
    self.displayViewBackgroundColor.wrappedValue = [UIColor redColor];
}
- (IBAction)changeViewWrappedValue:(id)sender {
    /// 更改试图的值
    self.displayView.updateWrappedValue([UIColor blueColor],@"");
}

@end

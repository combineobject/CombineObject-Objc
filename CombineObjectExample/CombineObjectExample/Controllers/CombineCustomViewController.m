//
//  CombineCustomViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/6.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineCustomViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineCustomViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UIView *displayView;
@property (nonatomic, strong) UIColor *displayViewBackgroundColor;

@end

@implementation CombineCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 初始化
    self.displayViewBackgroundColor = [UIColor grayColor];
    __weak typeof(self) weakSelf = self;
    self.displayViewBackgroundColor.bind.contentChanged = ^(id<CombineValue>  _Nonnull content) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.displayLabel.layer.borderWidth = 1;
        strongSelf.displayLabel.layer.borderColor = [(UIColor *)content CGColor];
    };
    /// 绑定到试图默认的 BackgroundColor 属性
    self.displayView.viewBind(self.displayViewBackgroundColor.bind,@"");
    /// 绑定UILabel 的文本颜色
    self.displayLabel.viewBind(self.displayViewBackgroundColor.bind,UILabelIdentifier.textColor);
}

- (IBAction)changeColor:(id)sender {
    /// 更改属性的值
    self.displayViewBackgroundColor.wrappedValue = [UIColor redColor];
}
- (IBAction)changeView:(id)sender {
    /// 更改试图的值
    self.displayView.updateWrappedValue([UIColor blueColor],@"");
}

@end

//
//  CombineProgressViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/6.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineProgressViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineProgressViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, strong) NSNumber *progress;

@end

@implementation CombineProgressViewController {
    CGFloat _progerssValue;
}

- (void)dealloc {
    NSLog(@"CombineProgressViewController");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _progerssValue = 0;
    self.progress = @(_progerssValue);
    __weak typeof(self) weakSelf = self;
    self.progress.bind.contentChanged = ^(id<CombineValue>  _Nonnull content) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.displayLabel.text = [NSString stringWithFormat:@"%.1f",[(NSNumber *)content floatValue]];
    };
    self.progressView.viewBind(self.progress.bind,@"");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf add];
    });
}

- (void)add {
    _progerssValue += 0.1;
    if (_progerssValue >= 1) {
        _progerssValue = 1;
    }
    self.progress.wrappedValue = @(_progerssValue);
    __weak typeof(self) weakSelf = self;
    if (_progerssValue == 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf remove];
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf add];
        });
    }
}

- (void)remove {
    _progerssValue -= 0.1;
    if (_progerssValue <= 0) {
        _progerssValue = 0;
    }
    self.progress.wrappedValue = @(_progerssValue);
    __weak typeof(self) weakSelf = self;
    if (_progerssValue == 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf add];
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf remove];
        });
    }
}

@end

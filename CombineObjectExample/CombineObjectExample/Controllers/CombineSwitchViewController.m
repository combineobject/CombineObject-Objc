//
//  CombineSwitchViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/6.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineSwitchViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineSwitchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, strong) NSNumber *state;

@end

@implementation CombineSwitchViewController

- (void)viewDidLoad {
    self.state = @(0);
    __weak typeof(self) weakSelf = self;
    self.state.bind.contentChanged = ^(id<CombineValue>  _Nonnull content) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        BOOL state = [(NSNumber *)content boolValue];
        strongSelf.displayLabel.text = state ? @"ON" : @"OFF";
    };
    [super viewDidLoad];
}

- (IBAction)switch:(id)sender {
    UISwitch *switchView = (UISwitch *)sender;
    self.state.wrappedValue = @(switchView.on);
}


@end

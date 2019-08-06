//
//  CombineSliderViewController.m
//  CombineObjectExample
//
//  Created by 张行 on 2019/8/6.
//  Copyright © 2019 张行. All rights reserved.
//

#import "CombineSliderViewController.h"
#import <CombineObjectObjc/NSObject+CombineBind.h>

@interface CombineSliderViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, copy) NSString *value;

@end

@implementation CombineSliderViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.value = @"0";
    self.displayLabel.viewBind(self.value.bind,@"");
}
- (IBAction)change:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.value.wrappedValue = [@(slider.value) stringValue];
}


@end

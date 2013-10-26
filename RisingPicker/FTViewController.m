//
//  FTViewController.m
//  MyPicker
//
//  Created by 古山 健司 on 2013/10/25.
//  Copyright (c) 2013年 TF. All rights reserved.
//
#import "FTAppDelegate.h"
#import "FTViewController.h"
#import "FTPickerViewController.h"

@interface FTViewController () <FTPickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *showPickerButton;
@property (weak, nonatomic) IBOutlet UILabel *selectedValue;
@property (nonatomic) FTPickerViewController *controller;
@property (nonatomic) UIView *myView;
@end

@implementation FTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPickerButtonDidPush:(id)sender
{
    LOG_METHOD
    if (self.controller == nil) {
        FTPickerViewController *controller = [[FTPickerViewController alloc] init];
        controller.delegate = self;
        controller.view.frame = self.view.frame;
        self.controller = controller;
        
        UIView *myView = controller.view;
        CGPoint screenCenter = self.view.center;
        UIWindow* mainWindow = (((FTAppDelegate *) [UIApplication sharedApplication].delegate).window);
        CGSize offSize = [UIScreen mainScreen].bounds.size;
        
        CGPoint offScreenCenter = CGPointMake(offSize.width/2, offSize.height*1.5);
        myView.center = offScreenCenter;
        [mainWindow addSubview:myView];
        self.myView = myView;
        [UIView animateWithDuration:0.5 animations:^{
            self.myView.center = screenCenter;
        }];
    }
}

#pragma mark - # FTPickerViewController Delegate
- (void)closePickerView:(FTPickerViewController *)controller valid:(BOOL)valid
{
    LOG_METHOD
    self.controller = nil;
    [UIView animateWithDuration:0.5 animations:^{
        CGSize offSize = [UIScreen mainScreen].bounds.size;
        CGPoint offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
        self.myView.center = offScreenCenter;
        if (valid) {
            self.selectedValue.text = [NSString stringWithFormat:@"%d", [controller.pickerView selectedRowInComponent:0]];
        }
    }];
}
@end

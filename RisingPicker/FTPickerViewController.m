//
//  FTPickerViewController.m
//  MyPicker
//
//  Created by 古山 健司 on 2013/10/25.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTPickerViewController.h"

@interface FTPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation FTPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    LOG_METHOD
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.75];

    UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeButtonDidPush:)];
    UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(canceluttonDidPush:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 260, 320, 40)];
    toolBar.items = [NSArray arrayWithObjects:closeButtonItem, space,cancelButtonItem, nil];
    [self.view addSubview:toolBar];
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 300, 320, 180)];
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    picker.backgroundColor = [UIColor clearColor];
    [self.view addSubview:picker];
    self.pickerView = picker;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d", row];
}

- (void)closeButtonDidPush:(id)sender
{
    LOG_METHOD
    [self.delegate closePickerView:self valid:YES];
}

- (void)canceluttonDidPush:(id)sender
{
    LOG_METHOD
    [self.delegate closePickerView:self valid:NO];
}
@end

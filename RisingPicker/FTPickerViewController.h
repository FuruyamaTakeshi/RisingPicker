//
//  FTPickerViewController.h
//  MyPicker
//
//  Created by 古山 健司 on 2013/10/25.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FTPickerViewControllerDelegate <NSObject>
- (void)closePickerView:(id)sender valid:(BOOL)valid;
@end
/**
 * @brief Pickerを保持するViewController
 */
@interface FTPickerViewController : UIViewController
@property (nonatomic) UIView *baseView;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (nonatomic) id <FTPickerViewControllerDelegate> delegate;
@end

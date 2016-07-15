//
//  ViewController.h
//  CurrencyConverterTWO
//
//  Created by Andrea Bolivar on 7/14/16.
//  Copyright © 2016 Andrea Bolivar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *inputHome;

@property (weak, nonatomic) IBOutlet UILabel *homeInputLabel;

@property (weak, nonatomic) IBOutlet UILabel *foreignOutputLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerForeign;


- (IBAction)buttonPressed:(id)sender;

@property (strong, nonatomic) NSArray *pickerDataHome;
@property (strong, nonatomic) NSArray *pickerDataForeign;

@property(strong, nonatomic) NSNumber* homeValue;
//@property(assign, nonatomic) double* exchangeRate;

@end
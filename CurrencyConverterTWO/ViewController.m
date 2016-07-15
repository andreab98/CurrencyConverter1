//
//  ViewController.m
//  CurrencyConverterTWO
//
//  Created by Andrea Bolivar on 7/14/16.
//  Copyright © 2016 Andrea Bolivar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pickerDataHome;
@synthesize pickerDataForeign;
@synthesize homeValue;
@synthesize homeInputLabel;
@synthesize foreignOutputLabel;
//@synthesize exchangeRate;

- (void)viewDidLoad {
    [super viewDidLoad];
    pickerDataHome = @[@"USD",@"CAD",@"AUD"];
    pickerDataForeign = @[@"USD",@"CAD",@"AUD"];

    // Do any additional setup after loading the view, typically from a nib.
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    self.pickerForeign.dataSource = self;
    self.pickerForeign.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return pickerDataForeign.count;
    return pickerDataHome.count;
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerDataForeign[row];
    return pickerDataHome[row];
}


- (IBAction)buttonPressed:(id)sender {
    homeValue=[NSNumber numberWithFloat:self.inputHome.text.floatValue];
    
    homeInputLabel.text=[NSString stringWithFormat:@"%.2f", homeValue.floatValue];
    
    NSUInteger num = [[self.picker dataSource]numberOfComponentsInPickerView:self.picker];
    NSMutableString *text = [NSMutableString string];
    for(NSUInteger i =0;i<num;++i)
    {
        NSUInteger selectRow = [self.picker selectedRowInComponent:i];
        NSString *ww = [[self.picker delegate] pickerView:self.picker titleForRow:selectRow forComponent:i];
        [text appendFormat:@"%@",ww];
        NSLog(@"%@",text);
    }
    NSUInteger numTwo = [[self.pickerForeign dataSource] numberOfComponentsInPickerView:self.pickerForeign];
    NSMutableString *textTwo = [NSMutableString string];
    for(NSUInteger i =0;i<numTwo;++i)
    {
        NSUInteger selectRow = [self.pickerForeign selectedRowInComponent:i];
        NSString *www = [[self.pickerForeign delegate] pickerView:self.pickerForeign titleForRow:selectRow forComponent:i];
        [textTwo appendFormat:@"%@",www];
        NSLog(@"%@",textTwo);
    }
    NSString *textString = [NSString stringWithString:text];
    NSString *textTwoString = [NSString stringWithString:textTwo];

    if (textString == textTwoString) {
        NSLog(@"HI");
        foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", homeValue.floatValue];
    }
    else if ([textString  isEqual: @"USD"]){
        if ([textTwoString isEqual: @"AUD"]){
            double exchangeRate=1.30914;
            double homeFloat = homeValue.floatValue;
            double result = exchangeRate * homeFloat;
            foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", result];
        }
        else if ([textTwoString isEqual: @"CAD"]){
            double exchangeRate=1.29206;
            double homeFloat = homeValue.floatValue;
            double result = exchangeRate * homeFloat;
            foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", result];
        }
    }
    else if ([textString isEqual: @"AUD"]){
        if ([textTwoString isEqual: @"USD"]){
            double exchangeRate= 0.763858;
            double homeFloat = homeValue.floatValue;
            double result = exchangeRate * homeFloat;
            foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", result];
        }
        else if ([textTwoString isEqual: @"CAD"]){
            double exchangeRate=0.986288;
            double homeFloat = homeValue.floatValue;
            double result = exchangeRate * homeFloat;
            foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", result];
        }
    }
    else{
        if ([textTwoString isEqual: @"USD"]){
            double exchangeRate=0.773959;
            double homeFloat = homeValue.floatValue;
            double result = exchangeRate * homeFloat;
            foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", result];
        }
        else if ([textTwoString isEqual: @"AUD"]){
            double exchangeRate=1.01390;
            double homeFloat = homeValue.floatValue;
            double result = exchangeRate * homeFloat;
            foreignOutputLabel.text=[NSString stringWithFormat:@"%.2f", result];
        }
    }
}


@end
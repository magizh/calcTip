//
//  ViewController.m
//  calcTip
//
//  Created by Magi Thiru on 4/4/15.
//  Copyright (c) 2015 Magi Thiru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tip;
@synthesize tipLabel;
@synthesize amt;
@synthesize total;

- (void) setDefaults {
    [tip setValue:(10)];
    [tipLabel setText:@"10%"];
    [amt becomeFirstResponder];
    [total setText:(@"$0.00")];
    [amt setText:@"0.00"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaults];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if ([string rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location == NSNotFound) {
        return NO;
    }
    NSMutableString *fullString  = [NSMutableString stringWithString:[amt text]];
    [fullString appendString:string];
    float value = fullString.floatValue;
    value = value * 10;
    [self calculate:value];
    [amt setText:[NSString stringWithFormat:@"%.01f", value]];
    return YES;
}


- (IBAction)sliderValueChanged:(id)sender
{
    // Set the label text to the value of the slider as it changes and recompute totatl
    [tipLabel setText: [NSString stringWithFormat:@"%@%%" , [NSNumber numberWithInt:self.tip.value]]];
    NSMutableString *fullString  = [NSMutableString stringWithString:[amt text]];
    float value = fullString.floatValue;
    [self calculate:value];
}

-(IBAction)calc:(id)sender {
    [tip resignFirstResponder];
    [amt resignFirstResponder];
}

-(void)calculate:(float)value {
    float tot = (value * [tip value])/100.0 ;
    [total setText: [NSString stringWithFormat: @"$%.2f", tot]];
}


-(IBAction)reset {
    // Reset all fields to defaults
    [self setDefaults];
}

@end

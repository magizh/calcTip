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

- (void)viewDidLoad {
    [super viewDidLoad];
    [tip setValue:(10)];
    [tipLabel setText:@"10%"];
    [amt becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location == NSNotFound) {
        return NO;
    }
    NSMutableString *fullString  = [NSMutableString stringWithString:[amt text]];
    [fullString appendString:string];
    int value = fullString.intValue;
    [self calculate:value];
    return YES;
}// return NO to not change text


- (IBAction)sliderValueChanged:(id)sender
{
    // Set the label text to the value of the slider as it changes
  //    self.label.text = [NSString stringWithFormat:@"%f", self.slider.value];
    [tipLabel setText: [NSString stringWithFormat:@"%@%%" , [NSNumber numberWithInt:self.tip.value]]];
    NSMutableString *fullString  = [NSMutableString stringWithString:[amt text]];
    int value = fullString.intValue;
    [self calculate:value];
}


-(IBAction)calc:(id)sender {
    [tip resignFirstResponder];
    [amt resignFirstResponder];
}

-(void)calculate:(int)value {
    float tot = (value * [tip value])/100.0 ;
    [total setText: [[NSNumber numberWithFloat:tot] stringValue]];
}

-(IBAction)reset{
    [tip setValue:(10)];
    [amt setText:(@"")];
    [total setText:(@"")];
    [tipLabel setText:@"10%"];
}
@end

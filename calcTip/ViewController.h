//
//  ViewController.h
//  calcTip
//
//  Created by Magi Thiru on 4/4/15.
//  Copyright (c) 2015 Magi Thiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amt;
@property (weak, nonatomic) IBOutlet UISlider *tip;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak,nonatomic) IBOutlet UILabel *total;

-(IBAction)calc:(id)sender;
-(void)calculate:(int)value;
-(IBAction)reset;

@end


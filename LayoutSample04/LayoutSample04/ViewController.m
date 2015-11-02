//
//  ViewController.m
//  LayoutSample04
//
//  Created by Nikolay Morev on 31/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *yellowText;
@property (weak, nonatomic) IBOutlet UITextField *greenText;

@end

@implementation ViewController

- (IBAction)yellowAction:(id)sender {
    [self.yellowText resignFirstResponder];
}

- (IBAction)greenAction:(id)sender {
    [self.greenText resignFirstResponder];
}

@end

//
//  ViewController.m
//  LayoutSample01
//
//  Created by Nikolay Morev on 24/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "GreenBoxViewController.h"

/**
 
 В ходе лэйаута во время поворота экрана анимация включается автоматически.

 */
@interface GreenBoxViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenBox;
@property (weak, nonatomic) IBOutlet UIView *redBox;
@property (weak, nonatomic) IBOutlet UISwitch *animationSwitch;

@end

@implementation GreenBoxViewController

- (void)viewDidLayoutSubviews {
    CGRect frame = [self randomFrame];

    self.greenBox.frame = frame;

    // Если нужно выключить анимацию

    [UIView setAnimationsEnabled:NO];
    self.redBox.frame = frame;
    [UIView setAnimationsEnabled:YES];

    [super viewDidLayoutSubviews];
}

- (CGRect)randomFrame {
    CGRect bounds = self.view.bounds;
    CGPoint origin =
    CGPointMake(arc4random() % (NSInteger)CGRectGetMaxX(bounds),
                arc4random() % (NSInteger)CGRectGetMaxY(bounds));
    CGSize size =
    CGSizeMake(arc4random() % (NSInteger)(CGRectGetMaxX(bounds) - origin.x),
               arc4random() % (NSInteger)(CGRectGetMaxY(bounds) - origin.y));
    return (CGRect){ origin, size };
}

- (IBAction)changePosition:(id)sender {
    if (self.animationSwitch.on) {
        // Если нужно включить анимацию
        
        [UIView animateWithDuration:0.33 animations:^{
            [self.view setNeedsLayout];
            [self.view layoutIfNeeded];
        }];
    }
    else {
        [self.view setNeedsLayout];
    }
}

@end

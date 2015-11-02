//
//  SecondViewController.m
//  LayoutSample03
//
//  Created by Nikolay Morev on 31/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "NSLayoutConstraintsViewController.h"

@interface NSLayoutConstraintsViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *smallerView;
@property (weak, nonatomic) IBOutlet UIView *biggerView;

@end

@implementation NSLayoutConstraintsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = self.view;
    UIView *greenView = self.greenView;
    UIView *smallerView = self.smallerView;
    UIView *biggerView = self.biggerView;

    // greenView

    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:greenView
                                  attribute:NSLayoutAttributeLeading
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:view
                                  attribute:NSLayoutAttributeLeadingMargin
                                 multiplier:1.f
                                   constant:0.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:greenView
                                  attribute:NSLayoutAttributeTrailing
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:view
                                  attribute:NSLayoutAttributeTrailingMargin
                                 multiplier:1.f
                                   constant:0.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:greenView
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.topLayoutGuide
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.f
                                   constant:0.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:view
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:greenView
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:2.f
                                   constant:0.f]];

    // smallerView

    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:smallerView
                                  attribute:NSLayoutAttributeLeading
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:greenView
                                  attribute:NSLayoutAttributeLeading
                                 multiplier:1.f
                                   constant:8.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:smallerView
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:greenView
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1.f
                                   constant:8.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:greenView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:smallerView
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.f
                                   constant:8.f]];
    // biggerView

    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:biggerView
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:greenView
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1.f
                                   constant:8.f]];

    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:greenView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:biggerView
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.f
                                   constant:8.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:greenView
                                  attribute:NSLayoutAttributeTrailing
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:biggerView
                                  attribute:NSLayoutAttributeTrailing
                                 multiplier:1.f
                                   constant:8.f]];

    // smallerView <-> biggerView

    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:biggerView
                                  attribute:NSLayoutAttributeLeading
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:smallerView
                                  attribute:NSLayoutAttributeTrailing
                                 multiplier:1.f
                                   constant:8.f]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:biggerView
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:smallerView
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:2.f
                                   constant:0.f]];
}

@end

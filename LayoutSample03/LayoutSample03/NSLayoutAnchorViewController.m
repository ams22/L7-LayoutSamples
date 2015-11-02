//
//  NSLayoutAnchorViewController.m
//  LayoutSample03
//
//  Created by Nikolay Morev on 31/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "NSLayoutAnchorViewController.h"

@interface NSLayoutAnchorViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *smallerView;
@property (weak, nonatomic) IBOutlet UIView *biggerView;

@end

@implementation NSLayoutAnchorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = self.view;
    UIView *greenView = self.greenView;
    UIView *smallerView = self.smallerView;
    UIView *biggerView = self.biggerView;
    UILayoutGuide *margin = self.view.layoutMarginsGuide;

    // greenView

    [greenView.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
    [greenView.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
    [greenView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor].active = YES;
    [view.heightAnchor constraintEqualToAnchor:greenView.heightAnchor multiplier:2.f].active = YES;

    // smallerView

    [smallerView.leadingAnchor constraintEqualToAnchor:greenView.leadingAnchor constant:8.f].active = YES;
    [smallerView.topAnchor constraintEqualToAnchor:greenView.topAnchor constant:8.f].active = YES;
    [greenView.bottomAnchor constraintEqualToAnchor:smallerView.bottomAnchor constant:8.f].active = YES;

    // biggerView

    [greenView.trailingAnchor constraintEqualToAnchor:biggerView.trailingAnchor constant:8.f].active = YES;
    [biggerView.topAnchor constraintEqualToAnchor:greenView.topAnchor constant:8.f].active = YES;
    [greenView.bottomAnchor constraintEqualToAnchor:biggerView.bottomAnchor constant:8.f].active = YES;

    // smallerView <-> biggerView

    [biggerView.leadingAnchor constraintEqualToAnchor:smallerView.trailingAnchor constant:8.f].active = YES;
    [biggerView.widthAnchor constraintEqualToAnchor:smallerView.widthAnchor multiplier:2.f].active = YES;
}

@end

//
//  VisualFormattingLanguageViewController.m
//  LayoutSample03
//
//  Created by Nikolay Morev on 31/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "VisualFormattingLanguageViewController.h"

@interface VisualFormattingLanguageViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *smallerView;
@property (weak, nonatomic) IBOutlet UIView *biggerView;

@end

@implementation VisualFormattingLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = self.view;
    UIView *greenView = self.greenView;
    UIView *smallerView = self.smallerView;
    UIView *biggerView = self.biggerView;
    id<UILayoutSupport> topLayoutGuide = self.topLayoutGuide;

//    NSDictionary *views = @{ @"view" : view,
//                             @"greenView" : greenView,
//                             @"smallerView" : smallerView,
//                             @"biggerView" : biggerView,
//                             @"topLayoutGuide" : topLayoutGuide };
    NSDictionary *views = NSDictionaryOfVariableBindings(view,
                                                         greenView,
                                                         smallerView,
                                                         biggerView,
                                                         topLayoutGuide);
    NSDictionary *metrics = @{ @"standardMargin" : @(20.f) };

    // greenView

    [view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-(standardMargin)-[greenView]-(20)-|"
                                             options:0
                                             metrics:metrics
                                               views:views]];
    [view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide][greenView]"
                                             options:0
                                             metrics:nil
                                               views:views]];
    [view addConstraint:
     [NSLayoutConstraint constraintWithItem:view
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:greenView
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:2.f
                                   constant:0.f]];

    // smallerView

    [greenView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-[smallerView]"
                                             options:0
                                             metrics:nil
                                               views:views]];
    [greenView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[smallerView]-|"
                                             options:0
                                             metrics:nil
                                               views:views]];

    // biggerView

    [greenView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"[smallerView]-[biggerView]-|"
                                             options:0
                                             metrics:nil
                                               views:views]];
    [greenView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[biggerView]-|"
                                             options:0
                                             metrics:nil
                                               views:views]];

    // smallerView <-> biggerView

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

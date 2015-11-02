//
//  FirstViewController.m
//  LayoutSample03
//
//  Created by Nikolay Morev on 31/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "InterfaceBuilderViewController.h"

@interface InterfaceBuilderViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *greenViewTopConstraint;

@end

@implementation InterfaceBuilderViewController

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    if (size.width > size.height) {
//        self.greenViewTopConstraint.constant = 100.f;
//    }
//    else {
//        self.greenViewTopConstraint.constant = 0.f;
//    }
}

@end

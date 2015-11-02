//
//  DoughnutViewController.m
//  LayoutSample01
//
//  Created by Nikolay Morev on 24/10/15.
//  Copyright © 2015 Nikolay Morev. All rights reserved.
//

#import "DoughnutViewController.h"

typedef NS_ENUM(NSUInteger, Mode) {
    Mode_Center,
    Mode_Bounds,
    Mode_Frame,
};

/**
 
 Как изменение center, bounds и frame влияет друг на друга

 */
@interface DoughnutViewController ()

@property (weak, nonatomic) IBOutlet UIView *imageContainer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *frameView;
@property (weak, nonatomic) IBOutlet UITextField *xField;
@property (weak, nonatomic) IBOutlet UITextField *yField;
@property (weak, nonatomic) IBOutlet UITextField *widthField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelection;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *translateSlider;

@end

@implementation DoughnutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateFieldsEnabled];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self populateFieldsWithView];
}

- (IBAction)apply:(id)sender {
    [self applyFieldsContentsToView];
}

- (IBAction)switchMode:(id)sender {
    [self populateFieldsWithView];
    [self updateFieldsEnabled];
}

- (void)populateFieldsWithView {
    UIView *view = self.imageContainer;

    switch (self.modeSelection.selectedSegmentIndex) {
        case Mode_Center:
            [self populateFieldsWithPoint:view.center];
            break;

        case Mode_Bounds:
            [self populateFieldsWithRect:view.bounds];
            break;

        case Mode_Frame:
            [self populateFieldsWithRect:view.frame];
            break;

        default:
            break;
    }

    self.frameView.frame = view.frame;
}

- (void)updateFieldsEnabled {
    NSInteger segment = self.modeSelection.selectedSegmentIndex;
    BOOL pointMode = segment == Mode_Center;
    BOOL rectMode = (segment == Mode_Bounds || segment == Mode_Frame);
    self.xField.enabled = pointMode || rectMode;
    self.yField.enabled = pointMode || rectMode;
    self.widthField.enabled = rectMode;
    self.heightField.enabled = rectMode;
}

- (void)populateFieldsWithPoint:(CGPoint)point {
    self.xField.text = [@(point.x) stringValue];
    self.yField.text = [@(point.y) stringValue];
    self.widthField.text = nil;
    self.heightField.text = nil;
}

- (CGPoint)pointFromFields {
    return CGPointMake([self.xField.text floatValue],
                       [self.yField.text floatValue]);
}

- (void)populateFieldsWithRect:(CGRect)rect {
    self.xField.text = [@(rect.origin.x) stringValue];
    self.yField.text = [@(rect.origin.y) stringValue];
    self.widthField.text = [@(rect.size.width) stringValue];
    self.heightField.text = [@(rect.size.height) stringValue];
}

- (CGRect)rectFromFields {
    return CGRectMake([self.xField.text floatValue],
                      [self.yField.text floatValue],
                      [self.widthField.text floatValue],
                      [self.heightField.text floatValue]);
}

- (void)applyFieldsContentsToView {
    UIView *view = self.imageContainer;

    switch (self.modeSelection.selectedSegmentIndex) {
        case Mode_Center:
            view.center = [self pointFromFields];
            break;

        case Mode_Bounds:
            view.bounds = [self rectFromFields];
            break;

        case Mode_Frame:
            view.frame = [self rectFromFields];
            break;

        default:
            break;
    }

    [self populateFieldsWithView];
}

- (IBAction)tap:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
    CALayer *layer = view.layer;
    layer.borderWidth = 5.f;
    layer.borderColor = [UIColor blueColor].CGColor;
    [self performSelector:@selector(resetLayer:) withObject:layer afterDelay:0.5];
}

- (void)resetLayer:(CALayer *)layer {
    layer.borderWidth = 0.f;
    layer.borderColor = nil;
}

#pragma mark - Rotation

- (IBAction)applyTransform:(id)sender {
    CGFloat scale = self.scaleSlider.value;
    CGFloat rotate = self.rotateSlider.value;
    CGFloat translate = self.translateSlider.value;

    self.imageContainer.transform =
    CGAffineTransformTranslate(CGAffineTransformRotate(CGAffineTransformScale(CGAffineTransformIdentity, scale, scale), rotate), translate, 0.f);
    ;
    [self populateFieldsWithView];
}

- (IBAction)resetTransform:(id)sender {
    self.scaleSlider.value = 1.f;
    self.rotateSlider.value = 0.f;
    self.translateSlider.value = 0.f;

    self.imageContainer.transform = CGAffineTransformIdentity;

    [self populateFieldsWithView];
}

@end

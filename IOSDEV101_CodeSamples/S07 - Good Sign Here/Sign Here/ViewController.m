//
//  ViewController.m
//  Sign Here
//
//  Created by Scott McCormack on 6/14/13.
//  Copyright (c) 2013 Scott McCormack. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet Canvas *inaccessible;
@property (weak, nonatomic) IBOutlet Canvas *almostAccessible;
@property (weak, nonatomic) IBOutlet Canvas *accessible;

@end

@implementation ViewController

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.subtype==UIEventSubtypeMotionShake)
    {
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, @"Clearing signatures");
        self.inaccessible.image = nil;
        self.almostAccessible.image = nil;
        self.accessible.image = nil;
        [self.accessible setAccessibilityValue:@"Empty"];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];  // View as first responder
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.almostAccessible setIsAccessibilityElement:YES];
    [self.almostAccessible setAccessibilityLabel:@"Sign here using your finger"];
    [self.accessible setIsAccessibilityElement:YES];
    [self.accessible setAccessibilityLabel:@"Sign here using your finger"];
    [self.accessible setAccessibilityValue:@"Empty"];
    [self.accessible setAccessibilityTraits:UIAccessibilityTraitAllowsDirectInteraction];
    [self.signInacc setAccessibilityTraits:UIAccessibilityTraitStaticText];
    [self.signPAcc setAccessibilityTraits:UIAccessibilityTraitHeader];
    [self.signAcc setAccessibilityTraits:UIAccessibilityTraitHeader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

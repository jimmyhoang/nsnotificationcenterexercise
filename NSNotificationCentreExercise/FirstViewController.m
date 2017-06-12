//
//  FirstViewController.m
//  NSNotificationCentreExercise
//
//  Created by Jimmy Hoang on 2017-06-11.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) NSDictionary* userInfo;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification* notification = [[NSNotification alloc] initWithName:@"StepIncrease" object:self userInfo:self.userInfo];
    [notificationCenter postNotification:notification];
    NSNumber* stepValue = [NSNumber numberWithDouble:self.stepper.value];
    self.userInfo =@{@"stepperValue": stepValue};
}



@end

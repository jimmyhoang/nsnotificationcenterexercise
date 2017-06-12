//
//  SecondViewController.m
//  NSNotificationCentreExercise
//
//  Created by Jimmy Hoang on 2017-06-11.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(increaseLabel:) name:@"StepIncrease" object:nil];

}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)increaseLabel:(NSNotification*)notification {
    
    if([notification.name isEqualToString:@"StepIncrease"]) {
        NSDictionary* userInfo = notification.userInfo;
        NSNumber* number = [userInfo objectForKey:@"stepperValue"];
        self.numberLabel.text = [NSString stringWithFormat:@"%@",number];
    }
    
}
@end

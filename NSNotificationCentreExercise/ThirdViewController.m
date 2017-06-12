//
//  ThirdViewController.m
//  NSNotificationCentreExercise
//
//  Created by Jimmy Hoang on 2017-06-11.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    _oldConstraint = self.bottomConstraint.constant;
}

-(void) keyboardDidChange:(NSNotification*)notification {
    NSValue* value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if (yPos == viewHeight) {
        self.bottomConstraint.constant = self.oldConstraint;
    } else {
        self.bottomConstraint.constant = viewHeight - yPos;
    }
}


@end

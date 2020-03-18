//
//  ViewController.m
//  RC_AlertAnimationDemo
//
//  Created by Roy CHANG on 2020/3/18.
//  Copyright © 2020 Roy CHANG. All rights reserved.
//

#import "ViewController.h"

#import "Alert_1_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)rc_alert_1_buttonEvent:(id)sender {
    
    Alert_1_ViewController *alert = [[Alert_1_ViewController alloc] initWithNibName:@"Alert_1_ViewController" bundle:nil];
    
    [self presentAlertController:alert];
}

@end

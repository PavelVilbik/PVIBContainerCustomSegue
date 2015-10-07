//
//  ViewController.m
//  PVIBContainerCustomSegueExample
//
//  Created by Vilbik Pavel on 7.10.15.
//  Copyright © 2015 PavelVilbik. All rights reserved.
//

#import "ViewController.h"
#import "PVIBContainerCustomSegue.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *removeSwitcher;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue isKindOfClass:[PVIBContainerCustomSegue class]]) {
        PVIBContainerCustomSegue *containerSegue = (PVIBContainerCustomSegue *)segue;
        containerSegue.containerView = self.containerView;
        containerSegue.animationType = self.segmentedControl.selectedSegmentIndex;
        
        containerSegue.useFirstChildViewConrollerAsCurrent = YES;
        containerSegue.onlyRemoveCurrentViewController = self.removeSwitcher.on;
    }
}

@end

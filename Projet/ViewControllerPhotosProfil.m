//
//  FirstViewController.m
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewControllerPhotosProfil.h"

@interface ViewControllerPhotosProfil ()

@end

@implementation ViewControllerPhotosProfil

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
//
//  VueConnection.m
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VueConnection.h"

@interface VueConnection ()

@end

@implementation VueConnection
@synthesize mdp;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setMdp:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btmdp:(id)sender {
    if ([mdp text] ==@"asdasd0") {
        [mdp setText:( @"hahaha")];
        
    } else {
        [mdp setText:( @"asdasd0")];
    }
    
}
@end

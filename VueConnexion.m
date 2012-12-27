//
//  VueConnexion.m
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VueConnexion.h"

@interface VueConnexion ()

@end

@implementation VueConnexion
@synthesize mdpOublie;
@synthesize textEmail;
@synthesize textMdp;

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
    [self setTextEmail:nil];
    [self setMdpOublie:nil];
    [self setTextMdp:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)next:(id)sender {
    [textMdp becomeFirstResponder];
}

- (IBAction) confirme:(id)sender
{
    [sender resignFirstResponder];
}
@end

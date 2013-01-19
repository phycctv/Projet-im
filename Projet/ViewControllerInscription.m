//
//  ViewControllerInscription.m
//  Projet
//
//  Created by Xiaowei ZHANG on 13-1-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewControllerInscription.h"

@interface ViewControllerInscription ()

@end

@implementation ViewControllerInscription
@synthesize textEmail;
@synthesize textMdp;
@synthesize textConfirmation;

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
    [self setTextMdp:nil];
    [self setTextConfirmation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)next:(id)sender {
    if(sender==textEmail)
    {
        [textMdp becomeFirstResponder];
    }
    else if(sender==textMdp)
    {
        [textConfirmation becomeFirstResponder];
    }
}

- (IBAction)done:(id)sender {
     [sender resignFirstResponder];
}

- (IBAction)begin:(id)sender {
    if(sender==textEmail)
    {
        self.view.center=CGPointMake(self.view.center.x,170);
    }
    else if(sender==textMdp || sender==textConfirmation)
    {
        self.view.center=CGPointMake(self.view.center.x,120);
    }
}

- (IBAction)end:(id)sender {
    self.view.center=CGPointMake(self.view.center.x,230);
}
@end

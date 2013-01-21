//
//  VueConnexion.m
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VueConnexion.h"
#import "ViewControllerInscription.h"

@interface VueConnexion ()

@end

@implementation VueConnexion
@synthesize mdpOublie;
@synthesize inscription;
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
    [self setInscription:nil];
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
    if ([self.textEmail.text isEqualToString:@""]  || [self.textMdp.text isEqualToString:@""] ) {
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil 
                                                   message:NSLocalizedString(@"email ou mdp non saisi", @"")  
                                                  delegate:nil 
                                         cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                         otherButtonTitles:nil     
                         ];
        [view show];
        [view release];
            } else {
                UIViewController *vc2=[[ViewControllerInscription alloc] init];
                [self.navigationController pushViewController:vc2 animated:YES];
                [vc2 release];
                [sender resignFirstResponder];                    
            }

}

- (IBAction)begin:(id)sender {
    if(sender==textEmail)
    {
        self.view.center=CGPointMake(self.view.center.x,80);
    }
    else if(sender==textMdp)
    {
        self.view.center=CGPointMake(self.view.center.x,60);
    }
    //return YES;
}

- (IBAction)end:(id)sender {
    self.view.center=CGPointMake(self.view.center.x,230);
}



@end

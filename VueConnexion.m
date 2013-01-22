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



- (IBAction)confirm:(id)sender
{
    if (([self.textEmail.text isEqualToString:@""] || textEmail.text ==nil)  ||
        ([self.textMdp.text isEqualToString:@""] || textMdp.text == nil)) {
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil 
                                                   message:NSLocalizedString(@"Email ou mot de passe non saisi(s)", @"")  
                                                  delegate:nil 
                                         cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                         otherButtonTitles:nil     
                         ];
        [view show];
        [view release];
            } else {
                if (1) {
                    
                }
                /*premier methode
                 UIStoryboard *board=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]; 
                UITabBarController *nextViewController =[board instantiateViewControllerWithIdentifier:@"ok"];
                [self.navigationController pushViewController:nextViewController animated:YES];
                 */
                // 2eme
                
                [self performSegueWithIdentifier:@"ohlala" sender:self];
                [sender resignFirstResponder];
                //[vc2 release];
                                    
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

- (IBAction)mdpOublie:(id)sender {
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.fr/search?q=what's+my+password%3F&ie=UTF-8&oe=UTF-8&hl=en"]];
}



@end

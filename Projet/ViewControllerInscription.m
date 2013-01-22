//
//  ViewControllerInscription.m
//  Projet
//
//  Created by Xiaowei ZHANG on 13-1-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewControllerInscription.h"
#import "ViewControllerInformations.h"

@interface ViewControllerInscription ()

@end

@implementation ViewControllerInscription
@synthesize textEmail;
@synthesize textMdp;
@synthesize textConfirmation;

// pour les trucs déjà connus en retour en arrière
//de cette vue
@synthesize emailConnu=_emailConnu;
@synthesize passwordConnu=_passwordConnu;
@synthesize confirmConnu=_confirmConnu;
//de la vue suivante
@synthesize nom=_nom;
@synthesize prenom=_prenom;
@synthesize jour=_jour;
@synthesize mois=_mois;
@synthesize annee=_annee;
@synthesize tel=_tel;

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
    textEmail.text = _emailConnu;
    textMdp.text = _passwordConnu;
    textConfirmation.text = _confirmConnu;
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

- (IBAction)confirm:(id)sender
{
    if (([self.textEmail.text isEqualToString:@""] || textEmail.text ==nil)  ||
        ([self.textMdp.text isEqualToString:@""] || textMdp.text == nil) ||
        ([self.textConfirmation.text isEqualToString:@""] && textConfirmation.text == nil)) {
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
                                                       message:NSLocalizedString(@"Email ou mot de passe non saisi(s)", @"")
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil
                             ];
        [view show];
        [view release];
    
    }
    else if (![self.textMdp.text isEqualToString:self.textConfirmation.text]) {
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
                                                       message:NSLocalizedString(@"Les deux mots de passe doivent être identiques", @"")
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil
                             ];
        [view show];
        [view release];
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"segueInformations"])
    {
        ViewControllerInformations *vcInf = [segue destinationViewController];
        vcInf.email = textEmail.text;
        vcInf.password = textMdp.text;
        vcInf.confirm = textConfirmation.text;
        
        //info de la vue suivante
        vcInf.nom = _nom;
        vcInf.prenom = _nom;
        vcInf.jour = _jour;
        vcInf.mois = _mois;
        vcInf.annee = _annee;
        vcInf.tel = _tel;
    }
}

@end

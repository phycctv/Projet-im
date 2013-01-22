//
//  ViewControllerInformations.m
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import "ViewControllerInformations.h"
#import "ViewControllerInscription.h"

@interface ViewControllerInformations ()

@end

@implementation ViewControllerInformations
@synthesize textNom;
@synthesize textPrenom;
@synthesize textJour;
@synthesize textMois;
@synthesize textAnnee;
@synthesize textTel;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextNom:nil];
    [self setTextPrenom:nil];
    [self setTextJour:nil];
    [self setTextMois:nil];
    [self setTextAnnee:nil];
    [self setTextTel:nil];
    //self.textMois.placeholder=@"mm";
    [super viewDidUnload];
}
- (IBAction)next:(id)sender {
    if(sender==textNom)
    {
        [textPrenom becomeFirstResponder];
    }
    else if(sender==textPrenom)
    {
        [textJour becomeFirstResponder];
    }
    else if(sender==textJour)
    {
        [textMois becomeFirstResponder];
    }
    else if(sender==textMois)
    {
        [textAnnee becomeFirstResponder];
    }
    else if(sender==textAnnee)
    {
        [textTel becomeFirstResponder];
    }
}

- (IBAction)confirm:(id)sender
{
    if (([self.textNom.text isEqualToString:@""] || textNom.text ==nil)  ||
        ([self.textPrenom.text isEqualToString:@""] || textPrenom.text == nil) ||
        ([self.textJour.text isEqualToString:@""] || textJour.text == nil) ||
        ([self.textMois.text isEqualToString:@""] || textMois.text == nil) ||
        ([self.textAnnee.text isEqualToString:@""] || textAnnee.text == nil)) {
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
                                                       message:NSLocalizedString(@"Nom, prénom et date obligatoires", @"")
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil
                             ];
        [view show];
        [view release]; 
    } else if ([self.textAnnee.text length]<=3){
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
                                                       message:NSLocalizedString(@"Mauvais format d'année (ex : 1999)", @"")
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil
                             ];
        [view show];
        [view release];
    } else if ([textTel.text length]!=0 && [textTel.text length]!=10){
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
                                                       message:NSLocalizedString(@"Le téléphone doit être composé de 10 chiffres", @"")
                                                      delegate:nil
                                             cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                             otherButtonTitles:nil
                             ];
        [view show];
        [view release];
    }
}

- (IBAction)confirmation:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)begin:(id)sender {
    if(sender==textNom || sender==textPrenom )
    {
        self.view.center=CGPointMake(self.view.center.x,170);
    }
    else if(sender==textJour || sender==textMois || sender==textAnnee)
    {
        [sender setText:@""];
        self.view.center=CGPointMake(self.view.center.x,120);
    }
    else if(sender==textTel)
    {
        self.view.center=CGPointMake(self.view.center.x,80);
    }
}

- (IBAction)end:(id)sender {
        self.view.center=CGPointMake(self.view.center.x,230);
}

- (IBAction)changed:(id)sender {
    if(sender==textJour)
    {
        if (self.textJour.text.length==2) {
            [textMois becomeFirstResponder];
        } 
    }
    else if(sender==textMois)
    {
        if (self.textMois.text.length==2) {
            [textAnnee becomeFirstResponder];
        }  
    }
    else if(sender==textAnnee)
    {
        if (self.textAnnee.text.length==4) {
            [textTel becomeFirstResponder];
        }
    }

}
@end

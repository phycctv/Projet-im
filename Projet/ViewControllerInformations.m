//
//  ViewControllerInformations.m
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import "ViewControllerInformations.h"

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
@end

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
    [super viewDidUnload];
}
- (IBAction)next:(id)sender {
}

- (IBAction)confirmation:(id)sender {
}

- (IBAction)begin:(id)sender {
}

- (IBAction)end:(id)sender {
}
@end

//
//  ViewControllerPhotoInscription.m
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import "ViewControllerPhotoInscription.h"

@interface ViewControllerPhotoInscription ()

@end

@implementation ViewControllerPhotoInscription
@synthesize butPrendrePhoto;

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
    [self setButPrendrePhoto:nil];
    [super viewDidUnload];
}
@end

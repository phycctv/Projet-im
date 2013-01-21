//
//  ViewControllerAfficherProfil.m
//  Projet
//
//  Created by marcelin on 19/01/13.
//
//

#import "ViewControllerAfficherProfil.h"

@interface ViewControllerAfficherProfil ()

@end

@implementation ViewControllerAfficherProfil

@synthesize textAAfficher=_textAAfficher;

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
    _labelTest.text = _textAAfficher;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_labelTest release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setLabelTest:nil];
    [super viewDidUnload];
}
@end

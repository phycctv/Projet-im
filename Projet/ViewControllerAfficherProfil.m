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
@synthesize lab1=_lab1;
@synthesize lab2=_lab2;
@synthesize lab3=_lab3;
@synthesize lab4=_lab4;
@synthesize lab5=_lab5;
@synthesize lab6=_lab6;


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
    NSString *strURL = [NSString stringWithFormat:@"http://projects.eyesnap.fr/project05/appli/profilAmi.php?id=%@",_textAAfficher];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
    NSArray *array = [strResult componentsSeparatedByString:@"</br>"];
    [self.lab1 setText:[array objectAtIndex:0]];
    [self.lab2 setText:[array objectAtIndex:1]];
    [self.lab3 setText:[array objectAtIndex:2]];
    [self.lab4 setText:[array objectAtIndex:3]];
    [self.lab5 setText:[array objectAtIndex:4]];
    [self.lab6 setText:[array objectAtIndex:5]];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_lab1 release];
    [_lab2 release];
    [_lab3 release];
    [_lab4 release];
    [_lab5 release];
    [_lab6 release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setLab1:nil];
    [self setLab2:nil];
    [self setLab3:nil];
    [self setLab4:nil];
    [self setLab5:nil];
    [self setLab6:nil];
    [super viewDidUnload];
}
@end

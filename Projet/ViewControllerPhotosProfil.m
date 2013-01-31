//
//  FirstViewController.m
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewControllerPhotosProfil.h"

@interface ViewControllerPhotosProfil ()

@end

@implementation ViewControllerPhotosProfil

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *strURLCompte = [NSString stringWithFormat:@"http://projects.eyesnap.fr/project05/appli/getSession.php"];
    NSData *dataURLCompte = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURLCompte]];
    NSString *idCompte = [[[NSString alloc] initWithData:dataURLCompte encoding:NSUTF8StringEncoding]autorelease];
    if ([idCompte isEqualToString:@"0"]) {
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        UITabBarController *nextViewController =[board instantiateViewControllerWithIdentifier:@"Connexion"];
        [self.navigationController pushViewController:nextViewController animated:YES];
    }
    else{
        NSString *strURL = [NSString stringWithFormat:@"http://projects.eyesnap.fr/project05/appli/getPhotosProfil.php"];
        NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
        if ([strResult isEqualToString:@""]) {
           // tableViewDataSource = [[NSArray alloc] initWithObjects:@"Il n'y a pas de photos sur le profil.", nil];
        }
        else if ([strResult isEqualToString:@"0"]) {
            UIStoryboard *board=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            UITabBarController *nextViewController =[board instantiateViewControllerWithIdentifier:@"Connexion"];
            [self.navigationController pushViewController:nextViewController animated:YES];
        }
        else
        {
            NSArray *tableActus = [[NSArray alloc] initWithArray:[strResult componentsSeparatedByString:@"##"]];
            
            //[tableViewDataSource addObject:nil];
            NSMutableArray * tableRecup = [[NSMutableArray alloc] initWithObjects: nil];
            for(NSString *line in tableActus){
                if ([line length]>2) {
                    NSArray *tableRecup2 = [[NSArray alloc] initWithArray:[line componentsSeparatedByString:@"::"]];
                    [tableRecup addObject:tableRecup2];
                }
            }
            // traitement des photos récupérés
        }
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end

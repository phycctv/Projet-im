//
//  ViewControllerInscription.h
//  Projet
//
//  Created by Xiaowei ZHANG on 13-1-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerInscription : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textEmail;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textMdp;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textConfirmation;

// éléments déjà enregistré (cas du retour en arrière
// pour cette vue
@property (strong, nonatomic) id emailConnu;
@property (strong, nonatomic) id passwordConnu;
@property (strong, nonatomic) id confirmConnu;
// pour la vue suivante
@property (strong, nonatomic) id nom;
@property (strong, nonatomic) id prenom;
@property (strong, nonatomic) id jour;
@property (strong, nonatomic) id mois;
@property (strong, nonatomic) id annee;
@property (strong, nonatomic) id tel;



- (IBAction)next:(id)sender;
- (IBAction)confirm:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)begin:(id)sender;
- (IBAction)end:(id)sender;

@end

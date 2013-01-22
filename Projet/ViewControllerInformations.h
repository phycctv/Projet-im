//
//  ViewControllerInformations.h
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerInformations : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textNom;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textPrenom;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textJour;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textMois;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textAnnee;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textTel;


//pour garder en mémoire les identifiants entrés la vue d'avant
@property (strong, nonatomic) id email;
@property (strong, nonatomic) id password;
@property (strong, nonatomic) id confirm;
//celle là
@property (strong, nonatomic) id nom;
@property (strong, nonatomic) id prenom;
@property (strong, nonatomic) id jour;
@property (strong, nonatomic) id mois;
@property (strong, nonatomic) id annee;
@property (strong, nonatomic) id tel;



- (IBAction)next:(id)sender;
- (IBAction)confirm:(id)sender;
- (IBAction)confirmation:(id)sender;
- (IBAction)begin:(id)sender;
- (IBAction)end:(id)sender;
- (IBAction)changed:(id)sender;

@end

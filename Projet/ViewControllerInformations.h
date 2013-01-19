//
//  ViewControllerInformations.h
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerInformations : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textNom;
@property (weak, nonatomic) IBOutlet UITextField *textPrenom;
@property (weak, nonatomic) IBOutlet UITextField *textJour;
@property (weak, nonatomic) IBOutlet UITextField *textMois;
@property (weak, nonatomic) IBOutlet UITextField *textAnnee;
@property (weak, nonatomic) IBOutlet UITextField *textTel;
- (IBAction)next:(id)sender;
- (IBAction)confirmation:(id)sender;
- (IBAction)begin:(id)sender;
- (IBAction)end:(id)sender;

@end

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
- (IBAction)next:(id)sender;
- (IBAction)confirmation:(id)sender;
- (IBAction)begin:(id)sender;
- (IBAction)end:(id)sender;
- (IBAction)changed:(id)sender;

@end

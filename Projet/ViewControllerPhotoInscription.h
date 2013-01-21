//
//  ViewControllerPhotoInscription.h
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerPhotoInscription : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *butPrendrePhoto;
- (IBAction)down:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)end:(id)sender;
- (IBAction)up:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *choisir;
- (IBAction)up2:(id)sender;

@end

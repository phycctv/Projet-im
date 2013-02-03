//
//  ViewControllerPhotoInscription.h
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerPhotoInscription : UIViewController<UIImagePickerControllerDelegate>{
    UIImagePickerController *pick2;
}
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *butPrendrePhoto;
@property (retain, nonatomic) IBOutlet UIButton *upload;
@property (retain, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)down:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)end:(id)sender;
- (IBAction)up:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *choisir;
- (IBAction)upload:(id)sender;


@end

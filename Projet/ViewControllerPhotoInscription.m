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
@synthesize choisir;
@synthesize butPrendrePhoto;
@synthesize imgView;
bool hasCamera;
UIImage *image;

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
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        hasCamera=YES;
    }else {
        hasCamera=NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setButPrendrePhoto:nil];
    [self setChoisir:nil];
    [self setImgView:nil];
    [super viewDidUnload];
}
- (IBAction)down:(id)sender {
   // [self.butPrendrePhoto setHidden:true];
}

- (IBAction)cancel:(id)sender {
   // [self.butPrendrePhoto setHidden:true];
}

- (IBAction)end:(id)sender {
    //[self.butPrendrePhoto setHidden:true];
}
-(void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType{
    NSArray *mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:sourceType];
    pick2=[[UIImagePickerController alloc]init];
    pick2.mediaTypes=mediaTypes;
    pick2.delegate=self;
    pick2.allowsEditing=YES;
    pick2.sourceType=sourceType;
    [self presentModalViewController:pick2 animated:YES];
}


- (IBAction)up:(id)sender {
    UIActionSheet *actionSheet;
    if (hasCamera==YES) {
        actionSheet=[[UIActionSheet alloc]initWithTitle:@"Photo de Profil" delegate:self cancelButtonTitle:@"Annuler" destructiveButtonTitle:nil otherButtonTitles:@"Prendre une Photo",@"Choisir dans Bibliotheque", nil];
    }else {
        actionSheet=[[UIActionSheet alloc]initWithTitle:@"Photo de Profil" delegate:self cancelButtonTitle:@"Annuler" destructiveButtonTitle:nil otherButtonTitles:@"Choisir dans Bibliotheque", nil];
    }
    [actionSheet showInView:self.view];
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    UIImagePickerControllerSourceType sourceType ;
    if (hasCamera==YES) {
        if (buttonIndex==0) {
            sourceType=UIImagePickerControllerSourceTypeCamera;
            [self getMediaFromSource:sourceType];
        }else if (buttonIndex==1) {
            sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            [self getMediaFromSource:sourceType];
        }
    }else {
        if (buttonIndex==0) {
            sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            [self getMediaFromSource:sourceType];
        }
    }
}
- (void)dealloc {
    [choisir release];
    [imgView release];
    [super dealloc];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

		UIImage *originalImage;

			originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
			//imgView = [[UIImageView alloc] initWithImage:originalImage];
    [imgView setImage:originalImage];
    [self dismissModalViewControllerAnimated:YES];
			//[imgView  ];
		
            
	
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	[pick2 dismissModalViewControllerAnimated:YES];
}@end

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
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.mediaTypes=mediaTypes;
    //picker.delegate=self;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
    [self presentModalViewController:picker animated:YES];
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
    [super dealloc];
}
- (IBAction)up2:(id)sender {
    UIActionSheet *actionSheet;
    actionSheet=[[UIActionSheet alloc]initWithTitle:@"Photo de Profil" delegate:self cancelButtonTitle:@"Annuler" destructiveButtonTitle:nil otherButtonTitles:@"Choisir dans Bibliotheque", nil];
    
    [actionSheet showInView:self.view];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	if ([mediaType isEqualToString:@"public.image"]){
		UIImage *originalImage;
		if ([[picker title] isEqualToString:@"Photo Albums"]) {
			originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
			UIImageView *imageView = [[UIImageView alloc] initWithImage:originalImage];
			UIScrollView *scrollView = [[UIScrollView alloc] init];
			[scrollView setScrollEnabled:YES];
			[scrollView setClipsToBounds:YES];
			[scrollView setBackgroundColor:[UIColor blackColor]];
			[scrollView setCanCancelContentTouches:NO];
			[scrollView setContentSize:CGSizeMake(imageView.frame.size.width, imageView.frame.size.height)];
			[scrollView addSubview:imageView];
			[imageView release];
			UIViewController *showImageController = [[UIViewController alloc] init];
			[showImageController setView:scrollView];
			[scrollView release];
			[picker pushViewController:showImageController animated:YES];
			[showImageController release];
		}
            
	}
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	[picker dismissModalViewControllerAnimated:YES];
}@end

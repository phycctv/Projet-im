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
@synthesize upload;
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
    [self setUpload:nil];
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
    [upload release];
    [super dealloc];
}
-(IBAction)upload:(id)sender{
        NSData *imageData = UIImageJPEGRepresentation(imgView.image, 0.5);
        NSString *urlString = @"http://projects.eyesnap.fr/project05/appli/upload.php";
    
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        NSString *temp = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"ipodfile.jpg\"\r\n"];
        [body appendData:[[NSString stringWithString:temp] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPBody:body];
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",returnString);
        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil 
                                                                                           message:NSLocalizedString(returnString, @"")  
                                                                                          delegate:nil 
                                                                                 cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                                                                 otherButtonTitles:nil   
                                                                 ];
    [view show];
    [view release];    /*
    //作為Round Rect Button的touch down事件
    //3.在implementation區段實做uploadImage方法，上傳Image View中的圖片到server上。程式碼:
    NSData *imageData = UIImageJPEGRepresentation(imgView.image, 90);
    //取得要上傳的圖片
    NSString *urlString = @"http://projects.eyesnap.fr/project05/appli/upload.php";
    //設定網址
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    //設定request物件
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    //加入header
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"ipodfile.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //設定body
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    //上傳
    NSLog(returnString);*/
    UIStoryboard *board=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil]; 
    UITabBarController *nextViewController =[board instantiateViewControllerWithIdentifier:@"Connexion"];
    //[self.navigationController pushViewController:nextViewController animated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

        UIImage *originalImage;

            originalImage = [info objectForKey: UIImagePickerControllerEditedImage];
            //imgView = [[UIImageView alloc] initWithImage:originalImage];
    [imgView setImage:originalImage];
    [self dismissModalViewControllerAnimated:YES];
    
    
    
    /*
    NSData *imageData = UIImageJPEGRepresentation(originalImage, 90);
    //取得要上傳的圖片
    NSString *urlString = @"http://projects.eyesnap.fr/project05/appli/upload.php";
    //設定網址
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    //設定request物件
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    //加入header
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"ipodfile.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    //設定body
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    //上傳
    NSLog(returnString);
     */

            //[imgView  ];
        
            
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [pick2 dismissModalViewControllerAnimated:YES];
    }
@end

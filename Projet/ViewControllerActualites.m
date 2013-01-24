//
//  ViewControllerActualites.m
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import "ViewControllerActualites.h"

@interface ViewControllerActualites ()

@end

@implementation ViewControllerActualites

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
    
    // récuperer une chaine contenant 10 fois : un idphotoprofil, un lienphotoprofil, un nom profil, un prenom profil, un id photo, un lien photo, un nom photo, un commentaire (peut être vide), une date
    // convertir ça en tableau à deux dimension : [10][8] qui récupère une chaine utf8 et la convertir. La chaine est découpée selon un caractère précis. ça semble simple.
    // le mettre dans tableViewDataSource au final

    
//    NSString *strURL = [NSString stringWithFormat:@"http://eyesnap.fr/project05/appli/getSession.php"];
//    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
//    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
//    if ([strResult isEqualToString:@"0"]) {
//        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
//            message:NSLocalizedString("Vous avez été déconnecté.", @"")
//            delegate:nil
//            cancelButtonTitle:NSLocalizedString( @"OK", @"")
//            otherButtonTitles:nil
//            ];
//        [view show];
//        [view release];
//        [self performSegueWithIdentifier:@"ohlala" sender:self];
//        [sender resignFirstResponder];
//    }
//    else{
//    NSString *strURL = [NSString stringWithFormat:@"http://eyesnap.fr/project05/appli/actualites.php?idcompte=%@",self.textEmail.text];
//    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
//    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
//    if ([strResult isEqualToString:@""]) {
//        tableViewDataSource = [[NSArray alloc] initWithObjects:@"Il n'y a pas d'actualités disponibles.", nil];
//    }
//    else if ([strResult isEqualToString:@"0"]) {
//        UIAlertView * view= [[UIAlertView alloc] initWithTitle:nil
//            message:NSLocalizedString("Vous avez été déconnecté.", @"")
//            delegate:nil
//            cancelButtonTitle:NSLocalizedString( @"OK", @"")
//            otherButtonTitles:nil
//            ];
//        [view show];
//        [view release];
//        [self performSegueWithIdentifier:@"ohlala" sender:self];
//        [sender resignFirstResponder];
//    }
//    else
//    {
//        NSArray *tableRecup;
//        NSMutableArray *tableRecupInter;
//        tableRecup = [strResult componentsSeparatedByString:@"##"];
//        for (NSInteger i=0; i < [tableRecup count]; i++) {
//            [tableRecupInter addObject:[tableRecup[i] componentsSeparatedByString:@"::"]];
//        }
//        tableViewDataSource = tableRecupInter;        
//    }
//    }
    
    tableViewDataSource = [[NSArray alloc] initWithObjects:@"Item 1", @"Item 2", @"Item 3", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableViewDataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // un idphotoprofil, un lienphotoprofil, un nom profil, un id photo, un lien photo, un nom photo, un commentaire (peut être vide), une date
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
//    NSArray *tableTemp = [tableViewDataSource objectAtIndex:[indexPath row]];
//    NSString *stringTemp = tableTemp[2];
//    NSString *titleText = [stringTemp stringByAppendingString:[tableTemp[3]]];
    
    NSString *titleText = [tableViewDataSource objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = titleText;
    
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  le code ressemblera probablement à ça pour accéder au machin sélectionné.
//
//    TActualite *actu = [tableViewDataSource objectAtIndex:[indexPath row]];
//    NSString *idImage = actu->idImage;
//
//  FIXME
//}

@end

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

    
    NSString *strURLCompte = [NSString stringWithFormat:@"http://eyesnap.fr/project05/appli/getSession.php"];
    NSData *dataURLCompte = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURLCompte]];
    NSString *idCompte = [[[NSString alloc] initWithData:dataURLCompte encoding:NSUTF8StringEncoding]autorelease];
    if ([idCompte isEqualToString:@"0"]) {
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        UITabBarController *nextViewController =[board instantiateViewControllerWithIdentifier:@"Connexion"];
        [self.navigationController pushViewController:nextViewController animated:YES];
    }
    else{
        NSString *strURL = [NSString stringWithFormat:@"http://eyesnap.fr/project05/appli/actualites.php"];
        NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
        if ([strResult isEqualToString:@""]) {
            tableViewDataSource = [[NSArray alloc] initWithObjects:@"Il n'y a pas d'actualités disponibles."   , nil];
        }
        else if ([strResult isEqualToString:@"0"]) {
            UIStoryboard *board=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            UITabBarController *nextViewController =[board instantiateViewControllerWithIdentifier:@"Connexion"];
            [self.navigationController pushViewController:nextViewController animated:YES];
        }
        else
        {
            NSArray *tableRecup;
            NSMutableArray *tableRecupInter;
            tableRecup = [strResult componentsSeparatedByString:@"##"];
            for (NSInteger i=0; i < [tableRecup count]; i++) {
                [tableRecupInter addObject:[tableRecup[i] componentsSeparatedByString:@"::"]];
            }
            tableViewDataSource = tableRecupInter;
        }
    }
    
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
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // un idphotoprofil, un lienphotoprofil, un nom profil, un id photo, un lien photo, un nom photo, un commentaire (peut être vide), une date
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSArray *tableTemp = [tableViewDataSource objectAtIndex:[indexPath row]];
    NSString *stringTemp = tableTemp[0];
    NSString *stringTemp2 = tableTemp[1];
    NSString *titleText = [stringTemp stringByAppendingString:stringTemp2];
    
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

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
    // récuperer un tableau de 10 cases contenant un type structuré : un idphotoprofil, un lienphotoprofil, un nom profil, un id photo, un lien photo, un nom photo, un commentaire (peut être vide), une date
    // convertir ça en type objective-C
    // le mettre dans tableViewDataSource
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
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

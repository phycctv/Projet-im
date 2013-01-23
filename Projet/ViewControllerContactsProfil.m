//
//  ViewControllerContactsProfil.m
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import "ViewControllerContactsProfil.h"
#import "ViewControllerAfficherProfil.h"

@interface ViewControllerContactsProfil ()

@end

@implementation ViewControllerContactsProfil

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
    
    // recupere une chaine qui contient fois x : un idProfil, un nom profil
    // convertir ça en tableau à deux dimension : [x][2] qui récupère une chaine et la convertir. La chaine est découpée selon un caractère précis. ça semble simple.
    
    //    NSString *strURL = [NSString stringWithFormat:@"http://eyesnap.fr/project05/appli/getContacts.php?idCompte=%@",self.textEmail.text];
    //    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    //    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
    //    if ([strResult isEqualToString:@""]) {
    //        tableViewDataSource = [[NSArray alloc] initWithObjects:@"Vous n'avez pas de contacts.", nil];
    //    }
    //
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
    static NSString *CellIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *titleText = [tableViewDataSource objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = titleText;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSArray *tableTemp = [tableViewDataSource objectAtIndex:[indexPath row]]
//    NSString *cont = tableTemp[0];
    NSString *cont = [tableViewDataSource objectAtIndex:[indexPath row]];
//    NSString *idProfil = cont->idProfil;

    if (cont!=@"Vous n'avez pas de contacts.")
    {
        [self performSegueWithIdentifier:@"segueConsultProfil" sender:self];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"segueConsultProfil"])
    {
        NSInteger selectedIndex = [[self->tableViewContacts indexPathForSelectedRow] row];
        ViewControllerAfficherProfil *vcap = [segue destinationViewController];
        vcap.textAAfficher = [NSString stringWithFormat:@"%@", [tableViewDataSource objectAtIndex:selectedIndex]];
    }

}

@end

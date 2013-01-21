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
    // recupere un tableau de type structuré qui contient : un idProfil, un nom profil
    // convertir ça en type objective-C
    // ça peut être un tableau à deux dimension : [x][2] qui récupère une chaine et la convertir. La chaine est découpée selon un caractère précis. ça semble simple.
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
//    TContact *cont = [tableViewDataSource objectAtIndex:[indexPath row]];
//    NSString *idProfil = cont->idProfil;

   [self performSegueWithIdentifier:@"segueConsultProfil" sender:self];
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

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
    
    // recupere une chaine qui contient fois x : un idProfil, un nom, prenom
    // convertir ça en tableau à deux dimension : [x][3] qui récupère une chaine et la convertir. La chaine est découpée selon un caractère précis. ça semble simple.
    
        NSString *strURL = [NSString stringWithFormat:@"http://projects.eyesnap.fr/project05/appli/getContact.php"];
        NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
        NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
        if ([strResult isEqualToString:@""]) {
            tableViewDataSource = [[NSArray alloc] initWithObjects:@"Vous n'avez pas de contacts.", nil];
        } else {
            NSArray *tableAmis = [[NSArray alloc] initWithArray:[strResult componentsSeparatedByString:@"</br>"]];
            
            //[tableViewDataSource addObject:nil];
            NSMutableArray * tableRecup = [[NSMutableArray alloc] initWithObjects: nil];
            NSMutableArray * tableRecup2 = [[NSMutableArray alloc] initWithObjects: nil];
            for(NSString *line in tableAmis){
                if ([line length]>2) {
                    NSArray *tableNom = [[NSArray alloc] initWithArray:[line componentsSeparatedByString:@"::"] ];
                    line = [[tableNom objectAtIndex:1 ] stringByAppendingFormat:@" "];
                    line = [line stringByAppendingFormat:[tableNom objectAtIndex:2 ]];
                    [tableRecup addObject:line];
                    [tableRecup2 addObject:[tableNom objectAtIndex:0]];
                }
            }
            tableViewDataSource = [[NSArray alloc] initWithArray:tableRecup];
            tableId = [[NSArray alloc] initWithArray:tableRecup2];
  /*          NSArray *tableRecup;
            NSMutableArray *tableRecupInter;
            tableRecup = [strResult componentsSeparatedByString:@"##"];
            for (NSInteger i=0; i < [tableRecup count]; i++) {
                [tableRecupInter addObject:[tableRecup objectsAtIndexes:i componentsSeparatedByString:@"::"]];
           }
            tableViewDataSource = tableRecupInter;*/
            //tableViewDataSource = [[NSArray alloc] initWithObjects:@"Item 1", @"Item 2", @"Item 3", nil];
        }
    //NSArray *array = [strResult componentsSeparatedByString:@"</br>"];
    
    
    
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
        vcap.textAAfficher = [NSString stringWithFormat:@"%@", [tableId objectAtIndex:selectedIndex]];
    }

}

@end

//
//  ViewControllerContactsProfil.h
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerContactsProfil : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableViewContacts;
    NSArray *tableViewDataSource;
    NSArray *tableId;
}

@end

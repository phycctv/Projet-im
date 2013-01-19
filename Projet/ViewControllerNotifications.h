//
//  ViewControllerNotifications.h
//  Projet
//
//  Created by marcelin on 17/01/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewControllerNotifications : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableViewNotif;
    NSArray *tableViewDataSource;
}


@end

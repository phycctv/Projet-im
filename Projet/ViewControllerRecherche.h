//
//  SecondViewController.h
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerRecherche: UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableViewRecherche;
    NSArray *tableViewDataSource;
}


@end

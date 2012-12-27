//
//  VueConnexion.h
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VueConnexion : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textMdp;
@property (weak, nonatomic) IBOutlet UILabel *mdpOublie;
- (IBAction)next:(id)sender;
- (IBAction) confirme:(id)sender;       
@end

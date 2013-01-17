//
//  VueConnexion.h
//  Projet
//
//  Created by Xiaowei ZHANG on 12-12-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VueConnexion : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textEmail;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textMdp;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *mdpOublie;
- (IBAction)next:(id)sender;
- (IBAction) confirme:(id)sender;
- (IBAction)begin:(id)sender;
-(BOOL)textFieldShouldReturn:(id)sender;

- (BOOL)textFieldShouldBeginEditing:(id)sender;
@end

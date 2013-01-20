//
//  ViewControllerInscription.h
//  Projet
//
//  Created by Xiaowei ZHANG on 13-1-19.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerInscription : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textEmail;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textMdp;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *textConfirmation;
- (IBAction)next:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)begin:(id)sender;
- (IBAction)end:(id)sender;

@end

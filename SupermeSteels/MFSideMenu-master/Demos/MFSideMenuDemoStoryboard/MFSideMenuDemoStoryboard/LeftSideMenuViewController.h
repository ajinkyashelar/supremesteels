//
//  LeftSideMenuViewController.h
//  MFSideMenuDemoStoryboard
//
//  Created by Ajinkya Shelar on 27/04/14.
//  Copyright (c) 2014 Michael Frederick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftSideMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;
@property (weak, nonatomic) IBOutlet UIButton *weightsBtn;
@property (weak, nonatomic) IBOutlet UIButton *productsBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
- (IBAction)homeBtnClicked:(id)sender;
- (IBAction)aboutBtnClicked:(id)sender;
- (IBAction)productsBtnClicked:(id)sender;
- (IBAction)weightsBtnClicked:(id)sender;
- (IBAction)contactBtnClicked:(id)sender;


@end

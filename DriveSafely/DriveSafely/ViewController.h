//
//  ViewController.h
//  DriveSafely
//
//  Created by Quang Dai on 6/11/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapkitViewController.h"
#import "ActionSheetViewController.h"
@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIButton *btnRunApp;
- (IBAction)btnRunAppTouchUpInside:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *btnManual;
- (IBAction)btnManualTouchUpInside:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *btnSettingMsg;
- (IBAction)btnSettingMsgTouchUpInside:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *btnAboutApp;
- (IBAction)btnAboutAppTouchUpInside:(id)sender;



@property MapkitViewController *mapkitVC;
@property ActionSheetViewController *aboutAppVC;








@end


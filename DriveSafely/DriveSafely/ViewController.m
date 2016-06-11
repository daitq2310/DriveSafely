//
//  ViewController.m
//  DriveSafely
//
//  Created by Quang Dai on 6/11/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import "ViewController.h"
#import "PublicValues.h"
#import "MLKMenuPopover.h"
#define MENU_POPOVER_FRAME  CGRectMake(self.view.frame.size.width - 140 - 10, 65, 140, 44*5)
@interface ViewController () <MLKMenuPopoverDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic,strong) MLKMenuPopover *menuPopover;
@property(nonatomic,strong) NSArray *menuItems;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self customNavigation];
    [self setupEachButton];
    
    self.menuItems = [NSArray arrayWithObjects:@"My Location", @"Driving Time", @"Take Photos", @"My Photos", @"Emergency", nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showMenuPopOver:(id)sender {
    [self.menuPopover dismissMenuPopover];
    
    self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:MENU_POPOVER_FRAME menuItems:self.menuItems];

    //self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:MENU_POPOVER_FRAME menuItems:self.menuItems];
    
    self.menuPopover.menuPopoverDelegate = self;
    [self.menuPopover showInView:self.view];

}




- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
{
    [self.menuPopover dismissMenuPopover];
    if (selectedIndex == 0) {
        [self myLocation];
    }
    if (selectedIndex == 1) {
        
    }
    if (selectedIndex == 2) {
        [self takePhotos];
    }
    if (selectedIndex == 3) {
        [self goMyPhotos];
    }
    if (selectedIndex == 4) {
        [self typeOfEmergency];
    }
    
}



#pragma mark - Emergency
- (void) callEmergency : (NSString *) phoneNumber{
    NSString *phoneCallNum =  [NSString stringWithFormat:@"tel://%@", phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneCallNum]];
    NSLog(@"phone btn touch %@", phoneCallNum);
}

- (void) typeOfEmergency {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"HAVING TROUBLE?"
                                  message:nil
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* sarBtn = [UIAlertAction
                                actionWithTitle:@"Search And Rescue"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [self callEmergency:@"0989505315"];
                                    
                                    
                                }];
    UIAlertAction* policeBtn = [UIAlertAction
                               actionWithTitle:@"Call The Police"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   [self callEmergency:@"0989505315"];
                                   
                               }];
    UIAlertAction* fireBtn = [UIAlertAction
                                actionWithTitle:@"Having A Fire"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [self callEmergency:@"0989505315"];
                                    
                                    
                                }];
    UIAlertAction* ambulanceBtn = [UIAlertAction
                               actionWithTitle:@"Need An Ambulance"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   [self callEmergency:@"0989505315"];
                                   
                               }];
    UIAlertAction* cancelBtn =[ UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action)
                               {
                                   
                                   
                               }];
    
    [alert addAction:sarBtn];
    [alert addAction:policeBtn];
    [alert addAction:fireBtn];
    [alert addAction:ambulanceBtn];
    [alert addAction:cancelBtn];
    
    [self presentViewController:alert animated:YES completion:nil];
}



#pragma mark - About Photos
//--------------------------------------------------------------------------------
//Take Photos
- (void) takePhotos{
    UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}

//--------------------------------------------------------------------------------
//Go Photos
- (void) goMyPhotos {
    UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:^{}];
}



#pragma mark - My Location
- (void) myLocation{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _mapkitVC = [storyboard instantiateViewControllerWithIdentifier:@"MapkitID"];
    
    [self.navigationController pushViewController:_mapkitVC animated:YES];
}



































- (IBAction)btnRunAppTouchUpInside:(id)sender {
    
}

- (IBAction)btnManualTouchUpInside:(id)sender {
    
}

- (IBAction)btnSettingMsgTouchUpInside:(id)sender {
    
}

- (IBAction)btnAboutAppTouchUpInside:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _aboutAppVC = [storyboard instantiateViewControllerWithIdentifier:@"AboutAppID"];
    UIView* myView = _aboutAppVC.view;
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:myView];
}














#pragma mark - [Layout] Custom Navigation Bar
- (void) customNavigation {
    //---------------------------------------------------------
    //set color for navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:3.0f/255.0f green:155.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    
    //---------------------------------------------------------
    //set title for back button
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //---------------------------------------------------------
    //set first title
    self.navigationItem.title = @"DRIVE SAFELY";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23], NSFontAttributeName, nil]];
    
    //---------------------------------------------------------
    //change style of StatusBar
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    //---------------------------------------------------------
    //Right button
    UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"more"]  ;
    [btnMore setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [btnMore addTarget:self action:@selector(showMenuPopOver:) forControlEvents:UIControlEventTouchUpInside];
    btnMore.frame = CGRectMake(0, 0, NAVIGATION_ITEM_WIDTH, NAVIGATION_ITEM_HEIGHT);
    UIBarButtonItem *buttonMore = [[UIBarButtonItem alloc] initWithCustomView:btnMore] ;
    self.navigationItem.rightBarButtonItem = buttonMore;
}






#pragma mark - [Layout] Setup Button
- (void) setupButton : (UIButton *) button{
    button.layer.cornerRadius = button.frame.size.width/2;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 1.0f;
}

- (void) setupEachButton {
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    [self setupButton:_btnRunApp];
    [self setupButton:_btnManual];
    [self setupButton:_btnSettingMsg];
    [self setupButton:_btnAboutApp];
}













@end

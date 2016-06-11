//
//  MapkitViewController.h
//  DriveSafely
//
//  Created by Quang Dai on 6/11/16.
//  Copyright © 2016 Quang Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapkitViewController : UIViewController <MKMapViewDelegate,  CLLocationManagerDelegate>

@property(nonatomic, retain) IBOutlet MKMapView *mapView;
@property(nonatomic, retain) CLLocationManager *locationManager;

@end

//
//  ViewController.m
//  iOS8_iBeaconTest01
//
//  Created by tikomo on 2014/12/11.
//  Copyright (c) 2014年 tikomo. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    
    [_locationManager requestAlwaysAuthorization]; // iOS8
    // [_locationManager requestWhenInUseAuthorization]; // iOS8
    
    [self chkBeaconStart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
// ビーコン監視を開始
//
-(void) chkBeaconStart{
    
    NSString *uuid = @"C768FFC6-B7C4-4079-8EC7-9094AAA19782";
    CLBeaconRegion *region = [[CLBeaconRegion alloc]initWithProximityUUID:[[NSUUID alloc]initWithUUIDString:uuid] identifier:@"MyBeacon"];
    
    [_locationManager startMonitoringForRegion:region]; // ビーコン領域の監視
    
}

//
// 領域内に入った場合
//
- (void) locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"didEnterRegion");
}

//
// 領域外に出た場合
//
- (void) locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"didExitRegion");
}

//
// 監視中にエラーが発生した場合
//
- (void) locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"monitoringDidFailForRegion");
}

@end

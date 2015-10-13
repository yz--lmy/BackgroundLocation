//
//  ViewController.m
//  BackgroundLocation
//
//  Created by Intertainment on 15/10/12.
//  Copyright © 2015年 Intertainment. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (![CLLocationManager locationServicesEnabled])
    {
        NSLog(@"请打开定位服务！");
        return;
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        [self.locMgr requestAlwaysAuthorization];
    }
   else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)
   {
       self.locMgr.desiredAccuracy = kCLLocationAccuracyBest;
       self.locMgr.distanceFilter = kCLDistanceFilterNone;
       [self.locMgr startUpdatingLocation];
   }
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations
{
   
    CLLocation * loc = [locations firstObject];
    CLLocationCoordinate2D coordinate = loc.coordinate;
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,loc.altitude,loc.course,loc.speed);
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground)
    {
        NSLog(@"进入后台了！！！");
        self.locLab.text = [NSString stringWithFormat:@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,loc.altitude,loc.course,loc.speed];
    }
    
}

#pragma mark 懒加载
-(CLLocationManager *)locMgr
{
    if (!_locMgr)
    {
        _locMgr = [[CLLocationManager alloc] init];
        _locMgr.delegate = self;
    }
    return _locMgr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

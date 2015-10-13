//
//  ViewController.h
//  BackgroundLocation
//
//  Created by Intertainment on 15/10/12.
//  Copyright © 2015年 Intertainment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    
}
@property(nonatomic,strong)CLLocationManager * locMgr;
@property (weak, nonatomic) IBOutlet UILabel *locLab;

@end


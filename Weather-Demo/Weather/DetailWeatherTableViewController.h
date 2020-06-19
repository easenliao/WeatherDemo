//
//  DetailWeatherTableViewController.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/18.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailWeatherTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *popOutlet;
@property (weak, nonatomic) IBOutlet UILabel *humidityOutlet;
@property (weak, nonatomic) IBOutlet UILabel *apparentTemperatureOutlet;
@property (weak, nonatomic) IBOutlet UILabel *confortIndexOutlet;
@property (weak, nonatomic) IBOutlet UILabel *windScaleOutlet;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionOutlet;

@end

NS_ASSUME_NONNULL_END

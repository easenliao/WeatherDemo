//
//  WeatherCollectionViewCell.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/16.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weatherOutlet;
@property (weak, nonatomic) IBOutlet UILabel *temperatureOutlet;
-(void)setModel:(NSString *) time Weather:(NSString *) weather Temperature:(NSString *) temperature;
@end

NS_ASSUME_NONNULL_END

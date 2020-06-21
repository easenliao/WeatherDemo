

#import "EveryThreeHourWeatherCollectionViewCell.h"

@implementation EveryThreeHourWeatherCollectionViewCell
-(void)setModel:(NSString *) time Weather:(NSString *) weather Temperature:(NSString *) temperature{
    [_timeOutlet setText:time];
    [_weatherOutlet setText:weather];
    [_temperatureOutlet setText:temperature];
}
@end

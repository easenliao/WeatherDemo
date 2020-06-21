
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "OpenWeatherMapAPI.h"
#import "EveryThreeHourWeatherCollectionViewCell.h"
#import "EveryThreeHourWeatherCollectionViewModel+extension.h"
#import "DateFormaterManager.h"
#import "DetailWeatherTableViewController.h"
#import "WeekWeatherView.h"
#import "WeekWeatherViewModel.h"
#import "WeekWeatherViewModel+extension.h"
#import "MainPageViewModel.h"
#import "MainPageViewModel+extension.h"
@interface ViewController : UIViewController <CLLocationManagerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>


@end


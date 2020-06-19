
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "OpenWeatherMapAPI.h"
#import "WeatherCollectionViewCell.h"
#import "WeatherModel.h"
#import "DetailWeatherTableViewController.h"
#import "WeatherView.h"
#import "WeatherViewModel.h"
@interface ViewController : UIViewController <CLLocationManagerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>


@end


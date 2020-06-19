

#import "ViewController.h"

#define kUpdateInterval 3600

@interface ViewController ()
@property (strong, nonatomic) DetailWeatherTableViewController *containerView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDate *lastUpdate;
@property (weak, nonatomic) IBOutlet UICollectionView *weatherCollectionOutlet;
@property (weak, nonatomic) IBOutlet UIScrollView *weatherInfoScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summaryHeightOutlet;
@property (weak, nonatomic) IBOutlet UIView *summaryViewOutlet;

@property (weak, nonatomic) IBOutlet UILabel *areaOutlet;
@property (weak, nonatomic) IBOutlet UILabel *wxOutlet;
@property (weak, nonatomic) IBOutlet UILabel *temperatureOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weekOutlet;

@property (strong, nonatomic) IBOutletCollection(WeatherView) NSArray *weekWeatherOutlets;
@property (strong, nonatomic) NSArray<WeaterCollevtionViewModel *> *collectionData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self enableLocationServices];
    [self setCollectionView];
    self.weatherInfoScrollView.delegate = self;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"DetailWeatherTableViewController"]) {
        DetailWeatherTableViewController * childViewController = (DetailWeatherTableViewController *) [segue destinationViewController];
        self.containerView = childViewController;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setCollectionView{
    self.weatherCollectionOutlet.delegate = self;
    self.weatherCollectionOutlet.dataSource = self;
    self.weatherCollectionOutlet.layer.borderWidth = 0.5f;
    self.weatherCollectionOutlet.layer.borderColor = UIColor.whiteColor.CGColor;
}
- (void)setMainPage:(MainPageViewModel *) model{
    [self.temperatureOutlet setText:model.t];
    [self.wxOutlet setText:model.wx];
    [self.areaOutlet setText:model.locationName];
    [self.weatherDescriptionOutlet setText:model.weatherDescription];
    [self.weekOutlet setText:model.week];
    [self.containerView.popOutlet setText:model.pop];
    [self.containerView.humidityOutlet setText:model.relativeHumidity];
    [self.containerView.apparentTemperatureOutlet setText:model.apparentTemperature];
    [self.containerView.confortIndexOutlet setText:model.comfortIndex];
    [self.containerView.windScaleOutlet setText:model.windSpeed];
    [self.containerView.windDirectionOutlet setText:model.windDirection];
    
}
- (void) setWeekWeatherView:(NSArray<WeatherViewModel *> *) models{
    for (int i = 0 ; i < self.weekWeatherOutlets.count; i++){
        WeatherView *item = self.weekWeatherOutlets[i];
        [item setModel:models[i]];
    }
}
#pragma mark - Location Services

- (void)enableLocationServices {
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            [self.locationManager requestWhenInUseAuthorization];
            [self.locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            [self.locationManager stopUpdatingLocation];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager startUpdatingLocation];
            break;
        default:
            break;
    }
}

#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if ([[NSDate date] timeIntervalSinceDate:self.lastUpdate] > kUpdateInterval || !self.lastUpdate) {
        
        /// threedays weather
        [[OpenWeatherMapAPI sharedInstance]
         fetchCurrentWeatherDataForLocation:[locations lastObject] APIURL:@"F-D0047-073"
         completion:^(Weather *weatherData) {
            MainPageViewModel *model = [MainPageViewModel alloc];
            model = [WeatherModel getMainPageViewModel:weatherData.records.locations.firstObject.location.firstObject];
            self.collectionData = [WeatherModel getCollectViews:weatherData.records.locations.firstObject.location.firstObject.weatherElement];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setMainPage:model];
                [self.weatherCollectionOutlet reloadData];
            });
            
            self.lastUpdate = [NSDate date];
            
        }
         failure:^(NSError *error) {
            NSLog(@"Failed: %@",error);
        }
         ];
        /// a week weather
        [[OpenWeatherMapAPI sharedInstance]
         fetchCurrentWeatherDataForLocation:[locations lastObject] APIURL:@"F-D0047-075"
         completion:^(Weather *weatherData) {
            NSDictionary<NSString *,WeatherViewModel *> *model = [WeatherModel getWeatherViewModels:weatherData.records.locations.firstObject.location.firstObject];
            NSArray *weeks = [WeatherModel getSevenDayWeekFormNow];
            NSMutableArray<WeatherViewModel *> *weatherViews = [NSMutableArray array];
            for (NSString *item in weeks) {
                WeatherViewModel *m = [model objectForKey:item];
                [weatherViews addObject: m];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setWeekWeatherView:weatherViews];
            });
            
            self.lastUpdate = [NSDate date];
            
        }
         failure:^(NSError *error) {
            NSLog(@"Failed: %@",error);
        }
         ];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            [self.locationManager requestWhenInUseAuthorization];
            [self.locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            [self.locationManager stopUpdatingLocation];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager startUpdatingLocation];
            break;
        default:
            break;
    }
}



#pragma mark - UICollectionViewDelegate Methods

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    WeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"weathercollectioncell" forIndexPath:indexPath];
    WeaterCollevtionViewModel *data = self.collectionData[indexPath.row];
    [cell setModel:data.time Weather:data.weatherDescription Temperature:data.temperature];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { 
    return [self.collectionData count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - UIScrollViewDelegate Methods
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    *targetContentOffset = scrollView.contentOffset;
    [self isShowSummaryView:(scrollView.contentOffset.y <= 0)];
}
-(void) isShowSummaryView:(BOOL) isShow{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2 animations:^{
            self.summaryHeightOutlet.constant = isShow ? 150 : 0;
            [self.summaryViewOutlet setHidden:!isShow];
            [self.view layoutIfNeeded];
        }];
    });
}
@end

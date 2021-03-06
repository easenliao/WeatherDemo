

#import "ViewController.h"

#define kUpdateInterval 3600

@interface ViewController ()
@property (strong, nonatomic) DetailWeatherTableViewController *containerViewController;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDate *lastUpdate;
@property (strong, nonatomic) NSArray<EveryThreeHourWeatherCollectionViewModel *> *collectionData;

@property (weak, nonatomic) IBOutlet UICollectionView *weatherCollectionOutlet;
@property (weak, nonatomic) IBOutlet UIScrollView *weatherInfoScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summaryHeightOutlet;
@property (weak, nonatomic) IBOutlet UIView *summaryViewOutlet;
@property (weak, nonatomic) IBOutlet UILabel *areaOutlet;
@property (weak, nonatomic) IBOutlet UILabel *wxOutlet;
@property (weak, nonatomic) IBOutlet UILabel *temperatureOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weekOutlet;
@property (strong, nonatomic) IBOutletCollection(WeekWeatherView) NSArray *weekWeatherOutlets;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self enableLocationServices];
    [self setupCollectionView];
    [self setupWeatherInfoScrollView];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self setupContainerViewController:segue];
}
-(void) setupContainerViewController:(UIStoryboardSegue *)segue{
    NSString * segueName = segue.identifier;
       if ([segueName isEqualToString: @"DetailWeatherTableViewController"]) {
           DetailWeatherTableViewController * childViewController = (DetailWeatherTableViewController *) [segue destinationViewController];
           self.containerViewController = childViewController;
       }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupWeatherInfoScrollView{
    self.weatherInfoScrollView.delegate = self;

}
- (void)setupCollectionView{
    self.weatherCollectionOutlet.delegate = self;
    self.weatherCollectionOutlet.dataSource = self;
    self.weatherCollectionOutlet.layer.borderWidth = 0.5f;
    self.weatherCollectionOutlet.layer.borderColor = UIColor.whiteColor.CGColor;
}
- (void)setMainPage:(MainPageViewModel *) model{
    [self.temperatureOutlet setText:model.temperature];
    [self.wxOutlet setText:model.weather];
    [self.areaOutlet setText:model.locationName];
    [self.weatherDescriptionOutlet setText:model.weatherDescription];
    [self.weekOutlet setText:model.dayOfWeek];
    [self.containerViewController.popOutlet setText:model.probabilityOfPrecipitation];
    [self.containerViewController.humidityOutlet setText:model.relativeHumidity];
    [self.containerViewController.apparentTemperatureOutlet setText:model.apparentTemperature];
    [self.containerViewController.confortIndexOutlet setText:model.comfortIndex];
    [self.containerViewController.windScaleOutlet setText:model.windSpeed];
    [self.containerViewController.windDirectionOutlet setText:model.windDirection];
    
}
- (void)setEveryThreeHourDataView:(Weather *)data{
    MainPageViewModel *model = [MainPageViewModel weatherFormAPIToMainPageViewModel:data];
    self.collectionData = [EveryThreeHourWeatherCollectionViewModel gwtCollectViewsFormAPIData:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setMainPage:model];
        [self.weatherCollectionOutlet reloadData];
    });
}
- (void) setWeekDataView:(Weather *) data{
    NSArray<WeekWeatherViewModel *> *WeekWeatherViews = [WeekWeatherViewModel getWeekWeatherViewModelsFormAPI:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        for (int i = 0 ; i < self.weekWeatherOutlets.count; i++){
            WeekWeatherView *item = self.weekWeatherOutlets[i];
            [item setModel:WeekWeatherViews[i]];
        }
    });
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
    [self fetchDataFormWeatherAPI: [locations lastObject]];
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
#pragma mark - fetchData Methods

- (void)fetchDataFormWeatherAPI:(CLLocation*) location{
    [self fetchEveryThreeHourDataThanSetView:location];
    [self fetchWeekDataThanSetView:location];
}
- (void)fetchEveryThreeHourDataThanSetView:(CLLocation*) location{
    if ([[NSDate date] timeIntervalSinceDate:self.lastUpdate] > kUpdateInterval || !self.lastUpdate) {
        [[OpenWeatherMapAPI sharedInstance]
         fetchWeekWeatherDataForLocation:location completion:^(Weather *weatherData) {
            [self setWeekDataView:weatherData];
            self.lastUpdate = [NSDate date];
        }
         failure:^(NSError *error) {
            NSLog(@"Failed: %@",error);
        }];
    }
}
- (void)fetchWeekDataThanSetView:(CLLocation*) location{
    if ([[NSDate date] timeIntervalSinceDate:self.lastUpdate] > kUpdateInterval || !self.lastUpdate) {
        [[OpenWeatherMapAPI sharedInstance]
         fetchEveryThreeHourWeatherDataForLocation:location
         completion:^(Weather *weatherData) {
            [self setEveryThreeHourDataView:weatherData];
            self.lastUpdate = [NSDate date];
        }
         failure:^(NSError *error) {
            NSLog(@"Failed: %@",error);
        }];
    }
}


#pragma mark - UICollectionViewDelegate Methods

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    EveryThreeHourWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EveryThreeHourWeatherCollectionViewCell" forIndexPath:indexPath];
    EveryThreeHourWeatherCollectionViewModel *data = self.collectionData[indexPath.row];
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

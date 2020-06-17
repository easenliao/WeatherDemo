

#import "ViewController.h"
#import "OpenWeatherMapAPI.h"
#import "WeatherCollectionViewCell.h"
#import "WeatherModel.h"
#define kUpdateInterval 3600

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDate *lastUpdate;
@property (weak, nonatomic) IBOutlet UICollectionView *weatherCollectionOutlet;
@property (weak, nonatomic) IBOutlet UIScrollView *weatherInfoScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *summaryHeightOutlet;
@property (weak, nonatomic) IBOutlet UIView *summaryViewOutlet;

@property (weak, nonatomic) IBOutlet UILabel *areaOutlet;
@property (weak, nonatomic) IBOutlet UILabel *wxOutlet;
@property (weak, nonatomic) IBOutlet UILabel *temperatureOutlet;
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
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.temperatureOutlet setText:model.t];
        [self.wxOutlet setText:model.wx];
        [self.areaOutlet setText:model.locationName];
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
    if ([[NSDate date] timeIntervalSinceDate:self.lastUpdate] > kUpdateInterval || !self.lastUpdate) {
        
        [[OpenWeatherMapAPI sharedInstance]
         fetchCurrentWeatherEveryThreeHourDataForLocation:[locations lastObject]
         completion:^(Weather *weatherEveryThreeHourData) {
            MainPageViewModel *model = [MainPageViewModel alloc];
            model = [WeatherModel getMainPageViewModel:weatherEveryThreeHourData.records.locations.firstObject.location.firstObject];
            [self setMainPage:model];
            self.collectionData = [WeatherModel getCollectViews:weatherEveryThreeHourData.records.locations.firstObject.location.firstObject.weatherElement];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.weatherCollectionOutlet reloadData];
            });
            
      
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //                                            self.degreesLabel.text = tempString;
                self.lastUpdate = [NSDate date];
            });
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

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    *targetContentOffset = scrollView.contentOffset;
    if (scrollView.contentOffset.y > 0){
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                self.summaryHeightOutlet.constant = 0;
                [self.summaryViewOutlet setHidden:YES];
            }];
        });
        
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                self.summaryHeightOutlet.constant = 150;
                [self.summaryViewOutlet setHidden:NO];
            }];
        });
        
    }
}
@end

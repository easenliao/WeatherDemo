

#import "ViewController.h"
#import "OpenWeatherMapAPI.h"
#import "WeatherCollectionViewCell.h"
#define kUpdateInterval 3600

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSDate *lastUpdate;
@property (weak, nonatomic) IBOutlet UICollectionView *weatherCollectionOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self enableLocationServices];
    self.weatherCollectionOutlet.delegate = self;
    self.weatherCollectionOutlet.dataSource = self;
    self.weatherCollectionOutlet.layer.borderWidth = 0.5f;
    self.weatherCollectionOutlet.layer.borderColor = UIColor.whiteColor.CGColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
            fetchCurrentWeatherDataForLocation:[locations lastObject]
                                    completion:^(Weather *weatherData) {
                                        
            NSString *tempString = weatherData.records.locations.firstObject.location.firstObject.weatherElement.firstObject.time.firstObject.elementValue.firstObject.value;
                                                                        
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
    [cell setModel:@"下午1點" Weather:@"多雲" Temperature:@"35"];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { 
    return 8;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


@end

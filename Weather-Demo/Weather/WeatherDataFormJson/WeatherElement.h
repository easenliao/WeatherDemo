#import <UIKit/UIKit.h>
#import "Time.h"

@interface WeatherElement : NSObject

@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * elementName;
@property (nonatomic, strong) NSArray<Time *> * time;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

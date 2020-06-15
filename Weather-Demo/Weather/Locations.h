#import <UIKit/UIKit.h>
#import "Location.h"

@interface Locations : NSObject

@property (nonatomic, strong) NSString * dataid;
@property (nonatomic, strong) NSString * datasetDescription;
@property (nonatomic, strong) NSArray<Location *> * location;
@property (nonatomic, strong) NSString * locationsName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

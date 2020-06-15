#import <UIKit/UIKit.h>
#import "Locations.h"

@interface Record : NSObject

@property (nonatomic, strong) NSArray<Locations *> * locations;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

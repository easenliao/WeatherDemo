#import <UIKit/UIKit.h>
#import "ElementValue.h"

@interface Time : NSObject

@property (nonatomic, strong) NSArray<ElementValue *> * elementValue;
@property (nonatomic, strong) NSString * endTime;
@property (nonatomic, strong) NSString * startTime;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

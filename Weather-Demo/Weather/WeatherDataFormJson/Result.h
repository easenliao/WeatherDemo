#import <UIKit/UIKit.h>
#import "Field.h"

@interface Result : NSObject

@property (nonatomic, strong) NSArray * fields;
@property (nonatomic, strong) NSString * resourceId;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
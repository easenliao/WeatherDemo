#import <UIKit/UIKit.h>

@interface Field : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
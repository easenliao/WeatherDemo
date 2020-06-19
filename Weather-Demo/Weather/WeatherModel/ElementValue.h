#import <UIKit/UIKit.h>

@interface ElementValue : NSObject

@property (nonatomic, strong) NSString * measures;
@property (nonatomic, strong) NSString * value;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
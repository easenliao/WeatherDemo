#import <UIKit/UIKit.h>
#import "Record.h"
#import "Result.h"

@interface Weather : NSObject

@property (nonatomic, strong) Record * records;
@property (nonatomic, strong) Result * result;
@property (nonatomic, assign) BOOL success;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
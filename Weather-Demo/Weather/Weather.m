//
//	Weather.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Weather.h"

NSString *const kWeatherRecords = @"records";
NSString *const kWeatherResult = @"result";
NSString *const kWeatherSuccess = @"success";

@interface Weather ()
@end
@implementation Weather




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherRecords] isKindOfClass:[NSNull class]]){
		self.records = [[Record alloc] initWithDictionary:dictionary[kWeatherRecords]];
	}

	if(![dictionary[kWeatherResult] isKindOfClass:[NSNull class]]){
		self.result = [[Result alloc] initWithDictionary:dictionary[kWeatherResult]];
	}

	if(![dictionary[kWeatherSuccess] isKindOfClass:[NSNull class]]){
		self.success = [dictionary[kWeatherSuccess] boolValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.records != nil){
		dictionary[kWeatherRecords] = [self.records toDictionary];
	}
	if(self.result != nil){
		dictionary[kWeatherResult] = [self.result toDictionary];
	}
	dictionary[kWeatherSuccess] = @(self.success);
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.records != nil){
		[aCoder encodeObject:self.records forKey:kWeatherRecords];
	}
	if(self.result != nil){
		[aCoder encodeObject:self.result forKey:kWeatherResult];
	}
	[aCoder encodeObject:@(self.success) forKey:kWeatherSuccess];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.records = [aDecoder decodeObjectForKey:kWeatherRecords];
	self.result = [aDecoder decodeObjectForKey:kWeatherResult];
	self.success = [[aDecoder decodeObjectForKey:kWeatherSuccess] boolValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Weather *copy = [Weather new];

	copy.records = [self.records copy];
	copy.result = [self.result copy];
	copy.success = self.success;

	return copy;
}
@end
//
//	WeatherElement.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeatherElement.h"

NSString *const kWeatherElementDescriptionField = @"description";
NSString *const kWeatherElementElementName = @"elementName";
NSString *const kWeatherElementTime = @"time";

@interface WeatherElement ()
@end
@implementation WeatherElement




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeatherElementDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kWeatherElementDescriptionField];
	}	
	if(![dictionary[kWeatherElementElementName] isKindOfClass:[NSNull class]]){
		self.elementName = dictionary[kWeatherElementElementName];
	}	
	if(dictionary[kWeatherElementTime] != nil && [dictionary[kWeatherElementTime] isKindOfClass:[NSArray class]]){
		NSArray * timeDictionaries = dictionary[kWeatherElementTime];
		NSMutableArray * timeItems = [NSMutableArray array];
		for(NSDictionary * timeDictionary in timeDictionaries){
			Time * timeItem = [[Time alloc] initWithDictionary:timeDictionary];
			[timeItems addObject:timeItem];
		}
		self.time = timeItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.descriptionField != nil){
		dictionary[kWeatherElementDescriptionField] = self.descriptionField;
	}
	if(self.elementName != nil){
		dictionary[kWeatherElementElementName] = self.elementName;
	}
	if(self.time != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Time * timeElement in self.time){
			[dictionaryElements addObject:[timeElement toDictionary]];
		}
		dictionary[kWeatherElementTime] = dictionaryElements;
	}
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
	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kWeatherElementDescriptionField];
	}
	if(self.elementName != nil){
		[aCoder encodeObject:self.elementName forKey:kWeatherElementElementName];
	}
	if(self.time != nil){
		[aCoder encodeObject:self.time forKey:kWeatherElementTime];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.descriptionField = [aDecoder decodeObjectForKey:kWeatherElementDescriptionField];
	self.elementName = [aDecoder decodeObjectForKey:kWeatherElementElementName];
	self.time = [aDecoder decodeObjectForKey:kWeatherElementTime];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	WeatherElement *copy = [WeatherElement new];

	copy.descriptionField = [self.descriptionField copy];
	copy.elementName = [self.elementName copy];
	copy.time = [self.time copy];

	return copy;
}
@end
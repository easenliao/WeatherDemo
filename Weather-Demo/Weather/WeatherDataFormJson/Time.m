//
//	Time.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Time.h"

NSString *const kTimeElementValue = @"elementValue";
NSString *const kTimeEndTime = @"endTime";
NSString *const kTimeStartTime = @"startTime";

@interface Time ()
@end
@implementation Time




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kTimeElementValue] != nil && [dictionary[kTimeElementValue] isKindOfClass:[NSArray class]]){
		NSArray * elementValueDictionaries = dictionary[kTimeElementValue];
		NSMutableArray * elementValueItems = [NSMutableArray array];
		for(NSDictionary * elementValueDictionary in elementValueDictionaries){
			ElementValue * elementValueItem = [[ElementValue alloc] initWithDictionary:elementValueDictionary];
			[elementValueItems addObject:elementValueItem];
		}
		self.elementValue = elementValueItems;
	}
	if(![dictionary[kTimeEndTime] isKindOfClass:[NSNull class]]){
		self.endTime = dictionary[kTimeEndTime];
	}	
	if(![dictionary[kTimeStartTime] isKindOfClass:[NSNull class]]){
		self.startTime = dictionary[kTimeStartTime];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.elementValue != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(ElementValue * elementValueElement in self.elementValue){
			[dictionaryElements addObject:[elementValueElement toDictionary]];
		}
		dictionary[kTimeElementValue] = dictionaryElements;
	}
	if(self.endTime != nil){
		dictionary[kTimeEndTime] = self.endTime;
	}
	if(self.startTime != nil){
		dictionary[kTimeStartTime] = self.startTime;
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
	if(self.elementValue != nil){
		[aCoder encodeObject:self.elementValue forKey:kTimeElementValue];
	}
	if(self.endTime != nil){
		[aCoder encodeObject:self.endTime forKey:kTimeEndTime];
	}
	if(self.startTime != nil){
		[aCoder encodeObject:self.startTime forKey:kTimeStartTime];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.elementValue = [aDecoder decodeObjectForKey:kTimeElementValue];
	self.endTime = [aDecoder decodeObjectForKey:kTimeEndTime];
	self.startTime = [aDecoder decodeObjectForKey:kTimeStartTime];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Time *copy = [Time new];

	copy.elementValue = [self.elementValue copy];
	copy.endTime = [self.endTime copy];
	copy.startTime = [self.startTime copy];

	return copy;
}
@end
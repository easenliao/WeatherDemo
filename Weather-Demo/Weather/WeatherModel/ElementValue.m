//
//	ElementValue.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ElementValue.h"

NSString *const kElementValueMeasures = @"measures";
NSString *const kElementValueValue = @"value";

@interface ElementValue ()
@end
@implementation ElementValue




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kElementValueMeasures] isKindOfClass:[NSNull class]]){
		self.measures = dictionary[kElementValueMeasures];
	}	
	if(![dictionary[kElementValueValue] isKindOfClass:[NSNull class]]){
		self.value = dictionary[kElementValueValue];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.measures != nil){
		dictionary[kElementValueMeasures] = self.measures;
	}
	if(self.value != nil){
		dictionary[kElementValueValue] = self.value;
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
	if(self.measures != nil){
		[aCoder encodeObject:self.measures forKey:kElementValueMeasures];
	}
	if(self.value != nil){
		[aCoder encodeObject:self.value forKey:kElementValueValue];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.measures = [aDecoder decodeObjectForKey:kElementValueMeasures];
	self.value = [aDecoder decodeObjectForKey:kElementValueValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ElementValue *copy = [ElementValue new];

	copy.measures = [self.measures copy];
	copy.value = [self.value copy];

	return copy;
}
@end
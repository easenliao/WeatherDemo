//
//	Field.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Field.h"

NSString *const kFieldIdField = @"id";
NSString *const kFieldType = @"type";

@interface Field ()
@end
@implementation Field




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kFieldIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kFieldIdField];
	}	
	if(![dictionary[kFieldType] isKindOfClass:[NSNull class]]){
		self.type = dictionary[kFieldType];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.idField != nil){
		dictionary[kFieldIdField] = self.idField;
	}
	if(self.type != nil){
		dictionary[kFieldType] = self.type;
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
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kFieldIdField];
	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:kFieldType];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kFieldIdField];
	self.type = [aDecoder decodeObjectForKey:kFieldType];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Field *copy = [Field new];

	copy.idField = [self.idField copy];
	copy.type = [self.type copy];

	return copy;
}
@end
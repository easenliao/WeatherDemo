//
//	Result.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Result.h"

NSString *const kResultFields = @"fields";
NSString *const kResultResourceId = @"resource_id";

@interface Result ()
@end
@implementation Result




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kResultFields] != nil && [dictionary[kResultFields] isKindOfClass:[NSArray class]]){
		NSArray * fieldsDictionaries = dictionary[kResultFields];
		NSMutableArray * fieldsItems = [NSMutableArray array];
		for(NSDictionary * fieldsDictionary in fieldsDictionaries){
			Field * fieldsItem = [[Field alloc] initWithDictionary:fieldsDictionary];
			[fieldsItems addObject:fieldsItem];
		}
		self.fields = fieldsItems;
	}
	if(![dictionary[kResultResourceId] isKindOfClass:[NSNull class]]){
		self.resourceId = dictionary[kResultResourceId];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.fields != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Field * fieldsElement in self.fields){
			[dictionaryElements addObject:[fieldsElement toDictionary]];
		}
		dictionary[kResultFields] = dictionaryElements;
	}
	if(self.resourceId != nil){
		dictionary[kResultResourceId] = self.resourceId;
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
	if(self.fields != nil){
		[aCoder encodeObject:self.fields forKey:kResultFields];
	}
	if(self.resourceId != nil){
		[aCoder encodeObject:self.resourceId forKey:kResultResourceId];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.fields = [aDecoder decodeObjectForKey:kResultFields];
	self.resourceId = [aDecoder decodeObjectForKey:kResultResourceId];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Result *copy = [Result new];

	copy.fields = [self.fields copy];
	copy.resourceId = [self.resourceId copy];

	return copy;
}
@end
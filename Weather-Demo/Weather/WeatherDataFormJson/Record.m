//
//	Record.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Record.h"

NSString *const kRecordlocations = @"locations";

@interface Record ()
@end
@implementation Record




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kRecordlocations] != nil && [dictionary[kRecordlocations] isKindOfClass:[NSArray class]]){
		NSArray * locationsDictionaries = dictionary[kRecordlocations];
		NSMutableArray * locationsItems = [NSMutableArray array];
		for(NSDictionary * locationsDictionary in locationsDictionaries){
            Locations * locationsItem = [[Locations alloc] initWithDictionary:locationsDictionary];
			[locationsItems addObject:locationsItem];
		}
		self.locations = locationsItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.locations != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Locations * locationsElement in self.locations){
			[dictionaryElements addObject:[locationsElement toDictionary]];
		}
		dictionary[kRecordlocations] = dictionaryElements;
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
	if(self.locations != nil){
		[aCoder encodeObject:self.locations forKey:kRecordlocations];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.locations = [aDecoder decodeObjectForKey:kRecordlocations];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Record *copy = [Record new];

	copy.locations = [self.locations copy];

	return copy;
}
@end

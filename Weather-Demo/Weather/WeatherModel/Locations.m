//
//	locations.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Locations.h"

NSString *const kLocationsDataid = @"dataid";
NSString *const kLocationsDatasetDescription = @"datasetDescription";
NSString *const kLocationsLocation = @"location";
NSString *const kLocationsLocationsName = @"locationsName";

@interface Locations ()
@end
@implementation Locations




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLocationsDataid] isKindOfClass:[NSNull class]]){
		self.dataid = dictionary[kLocationsDataid];
	}	
	if(![dictionary[kLocationsDatasetDescription] isKindOfClass:[NSNull class]]){
		self.datasetDescription = dictionary[kLocationsDatasetDescription];
	}	
	if(dictionary[kLocationsLocation] != nil && [dictionary[kLocationsLocation] isKindOfClass:[NSArray class]]){
		NSArray * locationDictionaries = dictionary[kLocationsLocation];
		NSMutableArray * locationItems = [NSMutableArray array];
		for(NSDictionary * locationDictionary in locationDictionaries){
			Location * locationItem = [[Location alloc] initWithDictionary:locationDictionary];
			[locationItems addObject:locationItem];
		}
		self.location = locationItems;
	}
	if(![dictionary[kLocationsLocationsName] isKindOfClass:[NSNull class]]){
		self.locationsName = dictionary[kLocationsLocationsName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.dataid != nil){
		dictionary[kLocationsDataid] = self.dataid;
	}
	if(self.datasetDescription != nil){
		dictionary[kLocationsDatasetDescription] = self.datasetDescription;
	}
	if(self.location != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Location * locationElement in self.location){
			[dictionaryElements addObject:[locationElement toDictionary]];
		}
		dictionary[kLocationsLocation] = dictionaryElements;
	}
	if(self.locationsName != nil){
		dictionary[kLocationsLocationsName] = self.locationsName;
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
	if(self.dataid != nil){
		[aCoder encodeObject:self.dataid forKey:kLocationsDataid];
	}
	if(self.datasetDescription != nil){
		[aCoder encodeObject:self.datasetDescription forKey:kLocationsDatasetDescription];
	}
	if(self.location != nil){
		[aCoder encodeObject:self.location forKey:kLocationsLocation];
	}
	if(self.locationsName != nil){
		[aCoder encodeObject:self.locationsName forKey:kLocationsLocationsName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.dataid = [aDecoder decodeObjectForKey:kLocationsDataid];
	self.datasetDescription = [aDecoder decodeObjectForKey:kLocationsDatasetDescription];
	self.location = [aDecoder decodeObjectForKey:kLocationsLocation];
	self.locationsName = [aDecoder decodeObjectForKey:kLocationsLocationsName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Locations *copy = [Locations new];

	copy.dataid = [self.dataid copy];
	copy.datasetDescription = [self.datasetDescription copy];
	copy.location = [self.location copy];
	copy.locationsName = [self.locationsName copy];

	return copy;
}
@end

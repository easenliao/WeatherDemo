//
//	Location.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Location.h"

NSString *const kLocationGeocode = @"geocode";
NSString *const kLocationLat = @"lat";
NSString *const kLocationLocationName = @"locationName";
NSString *const kLocationLon = @"lon";
NSString *const kLocationWeatherElement = @"weatherElement";

@interface Location ()
@end
@implementation Location




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLocationGeocode] isKindOfClass:[NSNull class]]){
		self.geocode = dictionary[kLocationGeocode];
	}	
	if(![dictionary[kLocationLat] isKindOfClass:[NSNull class]]){
		self.lat = dictionary[kLocationLat];
	}	
	if(![dictionary[kLocationLocationName] isKindOfClass:[NSNull class]]){
		self.locationName = dictionary[kLocationLocationName];
	}	
	if(![dictionary[kLocationLon] isKindOfClass:[NSNull class]]){
		self.lon = dictionary[kLocationLon];
	}	
	if(dictionary[kLocationWeatherElement] != nil && [dictionary[kLocationWeatherElement] isKindOfClass:[NSArray class]]){
		NSArray * weatherElementDictionaries = dictionary[kLocationWeatherElement];
		NSMutableArray * weatherElementItems = [NSMutableArray array];
		for(NSDictionary * weatherElementDictionary in weatherElementDictionaries){
			WeatherElement * weatherElementItem = [[WeatherElement alloc] initWithDictionary:weatherElementDictionary];
			[weatherElementItems addObject:weatherElementItem];
		}
		self.weatherElement = weatherElementItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.geocode != nil){
		dictionary[kLocationGeocode] = self.geocode;
	}
	if(self.lat != nil){
		dictionary[kLocationLat] = self.lat;
	}
	if(self.locationName != nil){
		dictionary[kLocationLocationName] = self.locationName;
	}
	if(self.lon != nil){
		dictionary[kLocationLon] = self.lon;
	}
	if(self.weatherElement != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(WeatherElement * weatherElementElement in self.weatherElement){
			[dictionaryElements addObject:[weatherElementElement toDictionary]];
		}
		dictionary[kLocationWeatherElement] = dictionaryElements;
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
	if(self.geocode != nil){
		[aCoder encodeObject:self.geocode forKey:kLocationGeocode];
	}
	if(self.lat != nil){
		[aCoder encodeObject:self.lat forKey:kLocationLat];
	}
	if(self.locationName != nil){
		[aCoder encodeObject:self.locationName forKey:kLocationLocationName];
	}
	if(self.lon != nil){
		[aCoder encodeObject:self.lon forKey:kLocationLon];
	}
	if(self.weatherElement != nil){
		[aCoder encodeObject:self.weatherElement forKey:kLocationWeatherElement];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.geocode = [aDecoder decodeObjectForKey:kLocationGeocode];
	self.lat = [aDecoder decodeObjectForKey:kLocationLat];
	self.locationName = [aDecoder decodeObjectForKey:kLocationLocationName];
	self.lon = [aDecoder decodeObjectForKey:kLocationLon];
	self.weatherElement = [aDecoder decodeObjectForKey:kLocationWeatherElement];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Location *copy = [Location new];

	copy.geocode = [self.geocode copy];
	copy.lat = [self.lat copy];
	copy.locationName = [self.locationName copy];
	copy.lon = [self.lon copy];
	copy.weatherElement = [self.weatherElement copy];

	return copy;
}
@end
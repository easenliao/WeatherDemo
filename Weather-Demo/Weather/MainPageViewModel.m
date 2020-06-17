//
//  MainPageViewModel.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/17.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "MainPageViewModel.h"

@implementation MainPageViewModel
- (id)init:(NSString *)locationName T:(NSString *)t Wx:(NSString *) wx{
    if (self = [super init])
     {
         self.locationName = locationName;
         self.t = t;
         self.wx = wx;

     }
     
     return self;
}
@end

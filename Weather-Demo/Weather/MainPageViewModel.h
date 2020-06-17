//
//  MainPageViewModel.h
//  Weather
//
//  Created by 廖宜陞 on 2020/6/17.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageViewModel : NSObject
@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) NSString *t;
@property (strong, nonatomic) NSString *wx;
-(id)init:(NSString *) locationName T:(NSString *) t Wx:(NSString *) wx;
@end

NS_ASSUME_NONNULL_END

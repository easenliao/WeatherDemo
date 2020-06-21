//
//  WeatherView.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/16.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "WeekWeatherView.h"
@interface WeekWeatherView()
@property (weak, nonatomic) IBOutlet UILabel *weekOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weatherOutlet;
@property (weak, nonatomic) IBOutlet UILabel *maxTOutlet;
@property (weak, nonatomic) IBOutlet UILabel *minTOutlet;

@end
@implementation WeekWeatherView

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self){
        [self loadNibContent];
    }
    return self;
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadNibContent];
    }
    return self;
}
-(void)loadNibContent{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
    NSArray<UIView *> *views = [nib instantiateWithOwner:self options:nil];
    UIView *contentView = views.firstObject;
    if (contentView == nil){
        return;
    }
    self.backgroundColor = UIColor.clearColor;
    [self addSubview:contentView];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [contentView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}
-(void)setModel:(WeekWeatherViewModel *) model{
    [self.maxTOutlet setText:model.maxT];
    [self.minTOutlet setText:model.minT];
    [self.weatherOutlet setText:model.weather];
    [self.weekOutlet setText:model.dayOfWeek];
}

@end

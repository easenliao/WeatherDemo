//
//  WeatherView.m
//  Weather
//
//  Created by 廖宜陞 on 2020/6/16.
//  Copyright © 2020 Aron Beaver. All rights reserved.
//

#import "WeatherView.h"
@interface WeatherView()
@property (weak, nonatomic) IBOutlet UILabel *weekOutlet;
@property (weak, nonatomic) IBOutlet UILabel *weatherOutlet;
@property (weak, nonatomic) IBOutlet UILabel *maxTOutlet;
@property (weak, nonatomic) IBOutlet UILabel *minTOutlet;

@end
@implementation WeatherView
UINib *nib;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
    nib = [UINib nibWithNibName:@"WeatherView" bundle:[NSBundle bundleForClass:[self class]]];
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
-(void)setModel:(WeatherViewModel *) model{
    [self.maxTOutlet setText:model.maxT];
    [self.minTOutlet setText:model.minT];
    [self.weatherOutlet setText:model.weather];
    [self.weekOutlet setText:model.week];
}

@end

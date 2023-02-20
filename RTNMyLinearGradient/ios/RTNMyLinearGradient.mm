//
//  RTNMyLinearGradient.m
//  rnapp
//
//  Created by  on 20/02/23.
//

#import "RTNMyLinearGradient.h"
 
#import <react/renderer/components/RTNMyLinearGradientSpecs/ComponentDescriptors.h>
#import <react/renderer/components/RTNMyLinearGradientSpecs/EventEmitters.h>
#import <react/renderer/components/RTNMyLinearGradientSpecs/Props.h>
#import <react/renderer/components/RTNMyLinearGradientSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RTNMyLinearGradient () <RCTRTNMyLinearGradientViewProtocol>
@end

@implementation RTNMyLinearGradient {
  UIView *_view;
  CAGradientLayer *_gradient;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RTNMyLinearGradientComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RTNMyLinearGradientProps>();
    _props = defaultProps;
    
    _view = [[UIView alloc] init];
    _gradient = [CAGradientLayer layer];
    _gradient.masksToBounds = YES;
    _gradient.startPoint = CGPointZero;
    _gradient.endPoint = CGPointMake(1, 1);
    
    [_view.layer insertSublayer:_gradient atIndex:0];
    
    self.contentView = _view;
  }
  
  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RTNMyLinearGradientProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RTNMyLinearGradientProps const>(props);
  
  if (oldViewProps.color != newViewProps.color) {
      NSMutableArray *colorArray = [[NSMutableArray alloc] init];
      for (int i = 0; i <= newViewProps.color.capacity() - 1; i++)
      {
        NSString *colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color[i].c_str()];
        
        
        unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:colorToConvert];
        [scanner setScanLocation:1]; // bypass '#' character
        [scanner scanHexInt:&rgbValue];
        
        [colorArray addObject: (id)[UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0].CGColor];
      }
      
      _gradient.colors = colorArray;
  }
  
  [super updateProps:props oldProps:oldProps];
}

- (void)updateLayoutMetrics:(const facebook::react::LayoutMetrics &)layoutMetrics oldLayoutMetrics:(const facebook::react::LayoutMetrics &)oldLayoutMetrics{
  [super updateLayoutMetrics:layoutMetrics oldLayoutMetrics:oldLayoutMetrics];
  _gradient.frame = _view.bounds;
}

@end

Class<RCTComponentViewProtocol> RTNMyLinearGradientCls(void)
{
  return RTNMyLinearGradient.class;
}

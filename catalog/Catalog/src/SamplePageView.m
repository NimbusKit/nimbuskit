//
// Copyright 2012 Manu Cornet
// Copyright 2011-2014 NimbusKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "SamplePageView.h"

@implementation SamplePageView

@synthesize pageIndex = _pageIndex;

- (id)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:CGRectZero])) {
    UIView* centeredView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.bounds) - 50, CGRectGetMidY(self.bounds) - 20, 40, 40)];
    centeredView.autoresizingMask = UIViewAutoresizingFlexibleMargins | UIViewAutoresizingFlexibleDimensions;
    centeredView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:centeredView];
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@ page index: %@", [super description], [@(_pageIndex) stringValue]];
}

- (void)setPageIndex:(NSInteger)pageIndex {
  _pageIndex = pageIndex;
  
  self.label.text = [NSString stringWithFormat:@"This is page %@", [@(pageIndex) stringValue]];
  
  UIColor* bgColor;
  UIColor* textColor;
  // Change the background and text color depending on the index.
  switch (pageIndex % 4) {
    case 0:
      bgColor = [UIColor redColor];
      textColor = [UIColor whiteColor];
      break;
    case 1:
      bgColor = [UIColor blueColor];
      textColor = [UIColor whiteColor];
      break;
    case 2:
      bgColor = [UIColor yellowColor];
      textColor = [UIColor blackColor];
      break;
    case 3:
      bgColor = [UIColor greenColor];
      textColor = [UIColor blackColor];
      break;
  }
  
  self.backgroundColor = bgColor;
  self.label.textColor = textColor;
  
  [self setNeedsLayout];
}

- (void)prepareForReuse {
  self.label.text = nil;
}

@end

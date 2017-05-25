//
//  ParallaxTableViewCell.h
//  ParallaxImageTable
//
//  Created by bob Chris on 2017/5/25.
//  Copyright © 2017年 bob Chris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxTableViewCell : UITableViewCell

@property (strong, nonatomic)UIImageView *parallaxImageView;

- (void)parallaxCellScroll:(UIView *)parentView;

@end

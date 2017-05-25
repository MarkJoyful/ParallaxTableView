//
//  ParallaxTableViewCell.m
//  ParallaxImageTable
//
//  Created by bob Chris on 2017/5/25.
//  Copyright © 2017年 bob Chris. All rights reserved.
//

#import "ParallaxTableViewCell.h"

@implementation ParallaxTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.parallaxImageView];
        // 剪切
        self.clipsToBounds = YES;
    }
    return self;
}


- (UIImageView *)parallaxImageView{
    
    if (_parallaxImageView == nil) {
        _parallaxImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    }
    return _parallaxImageView;
}

- (void)parallaxCellScroll:(UIView *)parentView{
    
    CGRect rect = [self.superview.superview convertRect:self.frame toView:parentView];
    
    // cell.y 到 parentView中心点的距离
    CGFloat yToCenterDistance = CGRectGetHeight(parentView.frame)/2 - CGRectGetMinY(rect);
    // imageview 和 cellHeight的高度差（imageView的frame一定要比cell高度大 才能有视觉差效果）
    CGFloat heightDiffentce = CGRectGetHeight(self.parallaxImageView.frame) - CGRectGetHeight(self.frame);
    /*
     * 当cell滑动到parentview的中心点时刚好显示图片的中心位置 （感谢@BestJoker的启发 http://www.jianshu.com/p/792bd33e5ddd）
     */
    CGFloat imageOffset_y = (yToCenterDistance / CGRectGetHeight(parentView.frame)) * heightDiffentce;
    CGRect originalRect = self.parallaxImageView.frame;
    originalRect.origin.y = imageOffset_y - (heightDiffentce/2);
    
    self.parallaxImageView.frame = originalRect;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

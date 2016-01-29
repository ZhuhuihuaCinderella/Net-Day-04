//
//  AppTableViewCell.m
//  爱限免
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "AppTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface AppTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *sharesLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end
@implementation AppTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
//    self.imageView.frame = self.contentView.frame;
}
- (void)configData:(AppModel *)mode {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:mode.iconUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.appNameLabel.text = mode.name;
    self.countLabel.text = [NSString stringWithFormat:@"下载：%@ 次",mode.downloads];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.1f",mode.lastPrice];
    self.sharesLabel.text = [NSString stringWithFormat:@"分享：%ld 次",mode.shares];
    self.favoritesLabel.text = [NSString stringWithFormat:@"%收藏：%ld 次",mode.favorites];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

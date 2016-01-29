//
//  CustomAppTableViewCell.m
//  爱限免
//
//  Created by Qianfeng on 16/1/23.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "CustomAppTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface CustomAppTableViewCell ()

@property (nonatomic, strong) UIImageView * headImageView;
@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * priceLable;
@property (nonatomic, strong) UILabel * typeLabel;
@property (nonatomic, strong) UILabel * sharesLable;
@property (nonatomic, strong) UILabel * favoratesLabel;
@property (nonatomic, strong) UILabel * downloadsLabel;

@property (nonatomic, strong) UIImageView * starCurrentImageView;
@property (nonatomic, strong) UIImageView * starImageView;
@end
@implementation CustomAppTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self initFrame];
}
- (void)initUI {
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cate_list_bg1"] highlightedImage:[UIImage imageNamed:@"cate_list_bg2"]];
    [self.contentView addSubview:_backgroundImageView];
    _headImageView = [[UIImageView alloc] init];
    _headImageView.clipsToBounds = YES;
    _headImageView.layer.cornerRadius = 10;
    [self.contentView addSubview:_headImageView];
    _starImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_starImageView];
    _starCurrentImageView = [[UIImageView alloc] init];
    _starCurrentImageView.contentMode = UIViewContentModeLeft;
    [self.contentView addSubview:_starCurrentImageView];
    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    _limitTimeLabel = [[UILabel alloc] init];
    _limitTimeLabel.font = [UIFont systemFontOfSize:14];
    _limitTimeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_limitTimeLabel];
    _priceLable = [[UILabel alloc] init];
    _priceLable.font = [UIFont systemFontOfSize:13];
    _priceLable.textColor = [UIColor grayColor];

    [self.contentView addSubview:_priceLable];
    _typeLabel = [[UILabel alloc] init];
    _typeLabel.font = [UIFont systemFontOfSize:13];
    _typeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_typeLabel];
    _sharesLable = [[UILabel alloc] init];
    _sharesLable.font = [UIFont systemFontOfSize:13];
    _sharesLable.textColor = [UIColor grayColor];
    [self.contentView addSubview:_sharesLable];
    _favoratesLabel = [[UILabel alloc] init];
    _favoratesLabel.font = [UIFont systemFontOfSize:13];
    _favoratesLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_favoratesLabel];
    _downloadsLabel = [[UILabel alloc] init];
    _downloadsLabel.font = [UIFont systemFontOfSize:13];
    _downloadsLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_downloadsLabel];
    _updatePriceLable = [[UILabel alloc] init];
    _updatePriceLable.font = [UIFont systemFontOfSize:14];
    _updatePriceLable.textColor = [UIColor grayColor];
    [self.contentView addSubview:_updatePriceLable];
    _starLabel = [[UILabel alloc] init];
    _starLabel.font = [UIFont systemFontOfSize:14];
    _starLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_starLabel];
}
- (void)initFrame {
    CGFloat leftSpace = 20;
    CGFloat topSpace = 10;
    _backgroundImageView.frame = self.contentView.frame;
    _headImageView.frame = CGRectMake(leftSpace, topSpace, 75, 75);
    CGFloat nameLabelX = CGRectGetMaxX(_headImageView.frame) + leftSpace;
    _nameLabel.frame = CGRectMake(nameLabelX, topSpace, 150, 20);
    CGFloat limitTimeLableY = CGRectGetMaxY(_nameLabel.frame)+ 10;
    _limitTimeLabel.frame = CGRectMake(nameLabelX, limitTimeLableY, 120, 17);
    _updatePriceLable.frame = _limitTimeLabel.frame;
    _starLabel.frame = _limitTimeLabel.frame;
    CGFloat starImageViewY = CGRectGetMaxY(_limitTimeLabel.frame) + 10;
    _starImageView.frame = CGRectMake(nameLabelX, starImageViewY,65, 23);
    _starCurrentImageView.frame = _starImageView.frame;
    CGFloat sharesLabelY = CGRectGetMaxY(_headImageView.frame) + topSpace;
    _sharesLable.frame = CGRectMake(leftSpace, sharesLabelY, 100, 10);
    CGFloat favorateLabelX = CGRectGetMaxX(_sharesLable.frame) + topSpace;
    _favoratesLabel.frame = CGRectMake(favorateLabelX, sharesLabelY, 100, 10);
    CGFloat downloadsLabelX = CGRectGetMaxX(_favoratesLabel.frame) + topSpace;
    _downloadsLabel.frame = CGRectMake(downloadsLabelX, sharesLabelY, 100, 10);
    _priceLable.frame = CGRectMake(300, 40, 80, 10);
    _typeLabel.frame = CGRectMake(310, 65, 60, 10);
}

- (void)configData:(AppModel *)mode {

    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:mode.iconUrl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.nameLabel.text = mode.name;
    self.downloadsLabel.text = [NSString stringWithFormat:@"下载：%@ 次",mode.downloads];
    self.priceLable.text = [NSString stringWithFormat:@"￥%.1f",mode.lastPrice];
    self.sharesLable.text = [NSString stringWithFormat:@"分享：%ld 次",mode.shares];
    self.favoratesLabel.text = [NSString stringWithFormat:@"收藏：%ld 次",mode.favorites];
    self.typeLabel.text = @"游戏";
    self.starImageView.image = [UIImage imageNamed:@"StarsBackground"];
    UIImage *image = [UIImage imageNamed:@"StarsForeground"];
    CGRect  rect = CGRectMake(0, 0, mode.starCurrent * 15, 23);
    image = [self clipImage:image withRect:rect];
    _starCurrentImageView.image = image;
    
}
-(UIImage *)clipImage:(UIImage *)image withRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    return [UIImage imageWithCGImage:imageRef];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

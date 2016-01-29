//
//  CustomAppTableViewCell.h
//  爱限免
//
//  Created by Qianfeng on 16/1/23.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"
@interface CustomAppTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView * backgroundImageView ;
@property (nonatomic, strong) UILabel * updatePriceLable;
@property (nonatomic, strong) UILabel * starLabel;
@property (nonatomic, strong) UILabel * limitTimeLabel;
- (void)configData:(AppModel *)mode;
@end

//
//  AppModel.h
//  爱限免
//
//  Created by Qianfeng on 16/1/21.
//  Copyright © 2016年 王鹏宇. All rights reserved.
//

#import "JSONModel.h"

@interface AppModel : JSONModel
//类型可以自动转换
//downloads = 1459;
//expireDatetime = "2016-01-24 01:00:25.0";
//favorites = 139;
//fileSize = "38.72";
//iconUrl = "http://photo.candou.com/i/114/2974e3a1afcf77d8574c47f2be5bcd9b";
//ipa = 1;
//itunesUrl = "http://itunes.apple.com/cn/app/dangleitis-hockey/id503264290?mt=8";
//lastPrice = 6;
//name = "\U7b56\U7565\U66f2\U68cd\U7403";
//priceTrend = limited;
//ratingOverall = 0;
//releaseDate = "2013-04-12";
//releaseNotes = "Fix a crash when playing without network connection";
//shares = 108;
//slug = "dangleitis-hockey";
//starCurrent = "4.5";
//starOverall = "4.5";
//updateDate = "2014-10-17 15:44:50";
//version = "1.4.2";


@property (nonatomic) NSInteger applicationId;
@property (nonatomic)NSInteger categoryId;
@property (nonatomic)NSInteger shares;
@property (nonatomic)NSInteger favorites;
@property (nonatomic)float starCurrent;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *iconUrl;
@property (nonatomic,copy) NSString *categoryName;
@property (nonatomic,copy) NSString *downloads;
@property (nonatomic) float lastPrice;
@property (nonatomic) float currentPrice;
@property (nonatomic) float starOverall;
@end

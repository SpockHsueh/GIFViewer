//
//  Giphy.h
//  GifViewer
//
//  Created by Spoke on 2019/1/6.
//  Copyright © 2019年 Spoke. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Data Model
@interface Giphy : NSObject

@property (strong, nonatomic) NSURL *stillImageURL;
@property (strong, nonatomic) NSURL *animatedGifURL;

+ (instancetype) giphyWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END

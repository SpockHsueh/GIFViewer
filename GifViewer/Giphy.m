//
//  Giphy.m
//  GifViewer
//
//  Created by Spoke on 2019/1/6.
//  Copyright © 2019年 Spoke. All rights reserved.
//

#import "Giphy.h"

@implementation Giphy

// class method
+ (instancetype) giphyWithDictionary: (NSDictionary *) dictionary {
    Giphy *giphy = [[Giphy alloc] init];
    
    if (giphy) {
        giphy.animatedGifURL = [NSURL URLWithString:
                                [dictionary valueForKeyPath:@"images.original.url"]];
        
        giphy.stillImageURL = [NSURL URLWithString:
                               [dictionary valueForKeyPath:@"images.downsized_still.url"]];
    }
    return giphy;
}

@end

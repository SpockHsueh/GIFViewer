//
//  CollectionViewCell.h
//  GifViewer
//
//  Created by Spoke on 2019/1/4.
//  Copyright © 2019年 Spoke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString *urlString;

@end

NS_ASSUME_NONNULL_END

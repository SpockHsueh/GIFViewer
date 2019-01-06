//
//  DetailViewController.h
//  GifViewer
//
//  Created by Spoke on 2019/1/6.
//  Copyright © 2019年 Spoke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Giphy;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) Giphy *giphy;


@end

NS_ASSUME_NONNULL_END

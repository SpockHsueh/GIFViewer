//
//  DetailViewController.m
//  GifViewer
//
//  Created by Spoke on 2019/1/6.
//  Copyright © 2019年 Spoke. All rights reserved.
//

#import "DetailViewController.h"
#import "Giphy.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.giphy) {
        NSURLRequest *request = [NSURLRequest requestWithURL:self.giphy.animatedGifURL];
        [self.webView loadRequest:request];
    }
    [self setupGestures];
}

- (void)setupGestures {
    UITapGestureRecognizer *dismiss = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismiss)];
    dismiss.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:dismiss];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(swipeToDismiss)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

- (void)dismiss {
    [UIView animateWithDuration:0.75 animations:^{
        self.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}

- (void) swipeToDismiss {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(500, 0);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:true completion:nil];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

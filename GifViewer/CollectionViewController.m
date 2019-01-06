//
//  CollectionViewController.m
//  GifViewer
//
//  Created by Spoke on 2019/1/4.
//  Copyright © 2019年 Spoke. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "Giphy.h"
#import "DetailViewController.h"

@interface CollectionViewController ()
@property (nonatomic, strong) NSMutableArray *giphys;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"GifViewerCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refershImages];
}

- (void) refershImages {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&rating=pg"];
    
    self.giphys = [NSMutableArray array];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:(url) completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // 會轉成 JSON 格式
        NSString *responseText = [[NSString alloc] initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
        
        // JSON response into an NSData
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        NSDictionary *dictionart = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
        
        NSArray *dictionaries = [dictionart valueForKey:@"data"];
        
        for (NSDictionary *dict in dictionaries) {
            Giphy *giphy = [Giphy giphyWithDictionary:dict];
            [self.giphys addObject:giphy];
        }
        
        NSLog(@"%@", self.giphys);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    }];
    [task resume];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        // 下面的作法也稱為 dependence injection
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
        Giphy *giphy = self.giphys[selectedIndexPath.row];
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.giphy = giphy;
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.giphys count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Giphy *giphy = [self.giphys objectAtIndex:indexPath.row];
    cell.giphy = giphy;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

@end

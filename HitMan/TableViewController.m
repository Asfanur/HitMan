//
//  TableViewController.m
//  HitMan
//
//  Created by Asfanur Arafin on 20/07/2015.
//  Copyright (c) 2015 Asfanur Arafin. All rights reserved.
//

#import "TableViewController.h"
#import "NetworkModelDownloader.h"
#import "ConstantCollection.h"
#import "ShowData.h"
#import "TableViewCell.h"
@interface TableViewController () {
    int page;
}
@property (nonatomic,strong) NSArray *movieData;
@property (nonatomic) BOOL isRefreshing;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadShowsWithOffset:@0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.movieData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ShowData *showData  = self.movieData[indexPath.row];
    cell.name.text = showData.name;
    cell.startTime.text = showData.startTime;
    cell.endTime.text = showData.endTime;
    cell.channell.text = showData.channel;
    cell.rating.text = showData.rating;
    
     
    return cell;
}

-(void)downloadShowsWithOffset:(NSNumber *)offset {
    [NetworkModelDownloader fetchMovieData:offset withCompletionBlock:^(NSError *error, NSDictionary *jsonDictionary) {
        self.isRefreshing = NO;
        if (error) {
            page--;
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                message:error.localizedDescription
                                                                         preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction *action) {
                                                                 [controller dismissViewControllerAnimated:YES completion:nil];
                                                             }];
            
            [controller addAction:okAction];
            [self presentViewController:controller animated:YES completion:nil];
            
            
        } else {
            NSMutableArray *tempArray = [[NSMutableArray alloc] init];
            
            for (NSDictionary *dictionary  in jsonDictionary[kResults]) {
               ShowData *showData = [[ShowData alloc] initWithName:dictionary[kName]
                                                      andstartTime:dictionary[kStartTime]
                                                           endTime:dictionary[kEndTime]
                                                          channell:dictionary[kChannel]
                                                         andRating:dictionary[kRating]];
                [tempArray addObject:showData];
            }
            
            self.movieData = [tempArray copy];
            [self.tableView reloadData];
            
             
        }
    }];
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height)) {
        if (!self.isRefreshing) {
            self.isRefreshing = YES;
            [self downloadShowsWithOffset:[NSNumber numberWithInt:page++]];
        }
    }
}



@end

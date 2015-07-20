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
@interface TableViewController ()
@property (nonatomic,strong) NSArray *movieData;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
     
    return cell;
}

-(void)downloadShowsWithOffset:(NSNumber *)offset {
    [NetworkModelDownloader fetchMovieData:offset withCompletionBlock:^(NSError *error, NSDictionary *jsonDictionary) {
        if (error) {
            
            
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

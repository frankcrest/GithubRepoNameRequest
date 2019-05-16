//
//  ViewController.m
//  GithubRepos
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "Repo.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView* tableView;
@property (nonatomic,strong)NSMutableArray* githubNameArray;
@property (nonatomic,strong)NSMutableArray<Repo*>* repoObjects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    self.repoObjects = [[NSMutableArray alloc]init];
    
    [self networkToGithub];
}

-(void)setupTableView{
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.translatesAutoresizingMaskIntoConstraints = 0;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"customCell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [NSLayoutConstraint activateConstraints:@[
                                              [tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
                                               [tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
                                               [tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
                                               [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0],
                                              ]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.repoObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    cell.label.text = self.repoObjects[indexPath.row].name;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)networkToGithub{
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/frankcrest/repos"]; // 1
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url]; // 2
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 3
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 4
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 2
        
        if (jsonError) { // 3
            // Handle the error
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        // If we reach this point, we have successfully retrieved the JSON from the API
        for (NSDictionary *repo in repos) { // 4
            
            NSString *repoName = repo[@"name"];
            Repo* repoObject = [[Repo alloc]initWithName:repoName];
            [self.repoObjects addObject:repoObject];
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }]; // 5
    
    [dataTask resume]; // 6
    
 
}

@end

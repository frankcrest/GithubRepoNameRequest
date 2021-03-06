//
//  CustomTableViewCell.h
//  GithubRepos
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel* label;

@property (weak,nonatomic)Repo* repo;

@end

NS_ASSUME_NONNULL_END

//
//  CustomTableViewCell.m
//  GithubRepos
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _label = [[UILabel alloc]initWithFrame:CGRectZero];
        _label.translatesAutoresizingMaskIntoConstraints = 0;
        _label.textColor = [UIColor blackColor];
        [self addSubview:_label];
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [_label.topAnchor constraintEqualToAnchor:self.topAnchor constant:0],
                                                  [_label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0],
                                                  [_label.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0],
                                                  [_label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0],
                                                  ]];
    }
      return self;
}

- (void)setRepo:(Repo *)repo{
    _repo = repo;
    
    self.label.text = repo.name;
}


@end

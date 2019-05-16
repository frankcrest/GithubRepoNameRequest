//
//  Repo.m
//  GithubRepos
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

+(instancetype)parseJSON:(NSDictionary*)json{
    return [[Repo alloc]initWithName:json[@"name"]];
}


@end

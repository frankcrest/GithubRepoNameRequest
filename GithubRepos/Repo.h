//
//  Repo.h
//  GithubRepos
//
//  Created by Frank Chen on 2019-05-16.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Repo : NSObject

@property (nonatomic, strong) NSString* name;

-(instancetype)initWithName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END

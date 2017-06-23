//
//  RWHMovie.m
//  MovieSearchObjC
//
//  Created by handje on 6/23/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "RWHMovie.h"

@implementation RWHMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSInteger)rating overview:(NSString *)overview {
    self = [super init];
    if (self) {
        _title = [title copy];
        _rating = rating;
        _overview = [overview copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *title = dictionary[@"original_title"];
    double rating = [dictionary[@"vote_average"] integerValue];
    NSString *overview = dictionary[@"overview"];
    return [self initWithTitle:title rating:rating overview:overview]; 
}

@end

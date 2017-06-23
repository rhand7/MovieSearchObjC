//
//  RWHMovieController.h
//  MovieSearchObjC
//
//  Created by handje on 6/23/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RWHMovie;

NS_ASSUME_NONNULL_BEGIN

@interface RWHMovieController : NSObject

+ (void)fetchMovieResultFor:(NSString *_Nullable)searchTerm completion:(void (^_Nullable)(NSArray<RWHMovie *> *_Nullable))completion; 

@end

NS_ASSUME_NONNULL_END

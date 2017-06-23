//
//  RWHMovie.h
//  MovieSearchObjC
//
//  Created by handje on 6/23/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWHMovie : NSObject

- (instancetype)initWithTitle:(NSString *)title
                       rating:(NSInteger)rating
                     overview:(NSString *)overview;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, strong, readonly) NSString *overview; 

@end

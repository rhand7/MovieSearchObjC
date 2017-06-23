//
//  RWHMovieController.m
//  MovieSearchObjC
//
//  Created by handje on 6/23/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "RWHMovieController.h"
#import "RWHMovie.h"

@implementation RWHMovieController

+ (void)fetchMovieResultFor:(NSString *)searchTerm completion:(void (^)(NSArray<RWHMovie *> * _Nullable))completion {
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie/"];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:@"107323a7d7e10eab25a2f1198ce48706"];
    NSURLQueryItem *searchTermQueryItem = [NSURLQueryItem queryItemWithName:@"query" value:searchTerm.lowercaseString];
    
    NSArray *queryItems = @[apiQueryItem, searchTermQueryItem]; 
    urlComponents.queryItems = queryItems;
    
    NSURL *movieSearchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:movieSearchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { NSLog(@"Error: %@", error); completion(nil); return; }
        if (!data) { NSLog(@"Error: No data returned from data task"); completion(nil); return; }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error: could not parse JSON, JSON is not of type NSDictionary");
            completion(nil);
            return;
        }
        NSMutableArray *movies = [[NSMutableArray alloc] init];
        
        for (NSDictionary *resultsDictionary in jsonDictionary[@"results"]) {
            RWHMovie *movie = [[RWHMovie alloc] initWithDictionary:resultsDictionary];
            [movies addObject:movie];
        }
        completion(movies);
    }] resume];
}

@end

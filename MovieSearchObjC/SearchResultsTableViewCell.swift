//
//  SearchResultsTableViewCell.swift
//  MovieSearchObjC
//
//  Created by handje on 6/23/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//


import UIKit

class SearchResultsTableViewCell: UITableViewCell {

    //IB Outlets 
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    //MARK: - Private
    func updateMovieCell(movie: RWHMovie) {
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(movie.rating)"
        movieOverviewLabel.text = movie.overview
    }
}

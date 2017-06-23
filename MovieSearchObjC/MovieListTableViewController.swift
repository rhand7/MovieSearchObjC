//
//  MovieListTableViewController.swift
//  MovieSearchObjC
//
//  Created by handje on 6/23/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {

    var movieSearchResults = [RWHMovie]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData() 
            }
        }
    }
    
    // MARK: - IB Outlet
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - searchBar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        RWHMovieController.fetchMovieResult(for: searchTerm) { (movies) in
            DispatchQueue.main.async {
                guard let movies = movies else { return }
                self.movieSearchResults = movies
            }
        }
    }

    // MARK: - TableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieSearchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? SearchResultsTableViewCell else { return SearchResultsTableViewCell() }

        let movie = movieSearchResults[indexPath.row]
        cell.updateMovieCell(movie: movie)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

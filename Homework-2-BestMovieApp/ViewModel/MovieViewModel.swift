//
//  MovieViewModel.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 7.01.2023.
//

import Foundation


struct MovieListViewModel {
    
    let movieList: [Movie]
    
    func numberOfRowsInSection() -> Int {
        return self.movieList.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movieList[index]
        return MovieViewModel(movieResult: movie)
    }
}

struct MovieViewModel {
    let movieResult : Movie
    
    var name: String {
        return self.movieResult.original_title!
    }
    var poster: String {
        return self.movieResult.poster_path!
    }
    var movieOverview: String {
        return self.movieResult.overview!
    }
    var movieDate: String {
        return self.movieResult.release_date!
    }
    var movieVoteAverage: Double {
        return self.movieResult.vote_average
    }
}

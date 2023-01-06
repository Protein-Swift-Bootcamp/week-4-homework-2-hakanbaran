//
//  MovieModel.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 6.01.2023.
//

import Foundation

struct BestMovieResponse: Codable {
    
    let results : [Movie]
    
}

struct Movie: Codable {
    let id : Int
    let original_title : String?
    let poster_path : String?
    let overview : String?
    let release_date : String?
    let vote_average : Double
}

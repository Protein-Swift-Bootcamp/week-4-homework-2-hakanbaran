//
//  YoutubeSearchResponse.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 7.01.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    
    let items : [VideoElement]
    
}

struct VideoElement : Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId : String
}

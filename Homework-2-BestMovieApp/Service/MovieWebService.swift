//
//  MovieWebService.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 6.01.2023.
//

import Foundation

class WebService {
    
     func downloadMovie(url : URL, completion : @escaping ([Movie]?) -> ()) {
             
             URLSession.shared.dataTask(with: url) { data, response, error1 in
                 if error1 != nil {
                     print(error1?.localizedDescription ?? "Error!!")
                     completion(nil)
                 } else if let data = data {
                     
                     let movieList = try? JSONDecoder().decode(BestMovieResponse.self, from: data)
                     
                     
                     if let movieList = movieList {
                         completion(movieList.results)
                     }
                 }
             }.resume()
         }
}

//
//  YoutubeAPICaller.swift
//  Homework-2-BestMovieApp
//
//  Created by Hakan Baran on 7.01.2023.
//

import Foundation


struct APIKey {
    
    static let youtubeAPIKey = "key=AIzaSyDXg4IMcWkSXkwT5DTWBVI88lv5VIk0Lh8"
    static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
}


class YoutubeApiCaller {
    
    
    static let shared = YoutubeApiCaller()
    
    
    func getMovieToYoutube(with query: String,completion: @escaping (Result<VideoElement, Error>) -> ()) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(APIKey.youtubeBaseURL)q=\(query)&\(APIKey.youtubeAPIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest.init(url: url)) { data, response, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
                
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
     
}

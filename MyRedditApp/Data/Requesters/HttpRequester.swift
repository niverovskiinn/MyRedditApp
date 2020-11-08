//
//  HttpRequester.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class HttpRequester {
        
    static let shared = HttpRequester()
    
    private init() {}

    func getSubredditPosts(from url: URLs,  completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url.url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Data is null")
                return
            }
            completion(data)
        }.resume()
    }
    
}

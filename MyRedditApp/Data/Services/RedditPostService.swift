//
//  RedditPostService.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class RedditPostService {
    private let httpRequester: HttpRequester
    private let persistenceManager: PersistenceManager
    
    init(httpRequester: HttpRequester, persistenceManager: PersistenceManager) {
        self.httpRequester = httpRequester
        self.persistenceManager = persistenceManager
    }
    
    func updatePosts(url: URLs, onCompletion: @escaping VoidCallback){
        httpRequester.getSubredditPosts(from: url) { (data) in
            do {
                let decodedResponse = try JSONDecoder().decode(SubredditRemote.self, from: data)
                self.persistenceManager.addSubreddit(key: url.subreddit, subreddit: decodedResponse)
                onCompletion()
            }
            catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
}

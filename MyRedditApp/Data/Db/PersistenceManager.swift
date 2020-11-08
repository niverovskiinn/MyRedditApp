//
//  PersistenceManager.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class PersistenceManager {
    private var subreddits: [String: SubredditRemote]
    
    static let shared = PersistenceManager()
    
    private init() {
        subreddits = [:]
    }
   
    
    func addSubreddit(key: String, subreddit: SubredditRemote){
        subreddits[key] = subreddit
    }
    
    func getSubreddit(key: String) -> SubredditRemote?{
        guard let subreddit =  subreddits[key] else {
            return nil
        }
        return subreddit
    }
}

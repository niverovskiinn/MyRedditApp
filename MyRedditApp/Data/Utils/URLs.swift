//
//  URLs.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

enum URLs {
    case redditTop(subreddit:String, limit: Int? = nil, after: String? = nil)
    
    var subreddit: String {
        switch self {
        case .redditTop(let subreddit, _ , _):
           return subreddit
        }
    }
    
    var url: String {
        switch self {
        case .redditTop(let subreddit, let limit, let after):
            var url = "https://www.reddit.com/r/\(subreddit)/top.json?"
            if let limit = limit {
                url += "limit=\(limit)&"
            }
            if let after = after {
                url += "after=\(after)"
            }
           return url
        }
    }
}

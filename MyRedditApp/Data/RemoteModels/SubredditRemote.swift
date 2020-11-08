//
//  SubredditPostRemote.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class SubredditRemote: Decodable{
    
    
    let posts: [RedditPostRemote]
    
    init(posts: [RedditPostRemote]) {
        self.posts = posts
    }
    
    private enum CodingKeys: CodingKey {
        case data
        case children
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        posts = try data.decode([RedditPostRemote].self, forKey: .children)
        
    }
}

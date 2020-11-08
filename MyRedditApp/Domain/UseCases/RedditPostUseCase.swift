//
//  RedditPostUseCase.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class RedditPostUseCase {
    
    private let repository: RedditPostRepository;
    
    init(repository: RedditPostRepository) {
        self.repository = repository
    }
    
    func getPosts(subreddit: String, amount: Int? = nil, after: String? = nil, onCompletion: @escaping RedditPostsCallback){
        repository.getPosts(from: subreddit, amount: amount, after: after, onCompletion: onCompletion)
    }
}

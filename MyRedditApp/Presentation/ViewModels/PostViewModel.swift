//
//  PostViewModel.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation


class PostViewModel {
    private let redditPostUseCase: RedditPostUseCase

    init(redditPostUseCase: RedditPostUseCase){
        self.redditPostUseCase = redditPostUseCase
    }
    
    var post: RedditPost?
    
    func getPost(from subreddit: String, onCompletion: @escaping RedditPostCallback) {
        redditPostUseCase.getPosts(subreddit: subreddit, amount: 1) {
                (posts) in
                guard let post = posts.first else
                {return}
                self.post = post
                onCompletion(post)
            }
    }
}

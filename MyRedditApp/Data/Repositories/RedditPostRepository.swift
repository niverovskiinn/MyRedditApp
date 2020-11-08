//
//  RedditPostRepository.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class RedditPostRepository {
    
    private let dbManager: PersistenceManager;
    private let service: RedditPostService;


    init(dbManager: PersistenceManager, service: RedditPostService) {
        self.dbManager = dbManager
        self.service = service
    }
    
    func getPosts(from subredditName: String, amount: Int?, after: String?, onCompletion: @escaping RedditPostsCallback) {
        self.service.updatePosts(url: .redditTop(subreddit: subredditName, limit: amount, after: after)) { () in
            
            if let subreddit = self.dbManager.getSubreddit(key: subredditName) {
                let posts = subreddit.posts.map { (postRemote) -> RedditPost in
                    return RedditPost(id: postRemote.id, username: postRemote.username, domain: postRemote.domain, title: postRemote.title, created: Date.init(timeIntervalSince1970: TimeInterval(postRemote.created)), imageUrl: postRemote.imageUrl, ups: postRemote.ups , downs: postRemote.downs , numComments: postRemote.numComments, subreddit: subredditName)
               }
                onCompletion(posts)

            }
            else {
           
            
            }
        }
    }
    
}

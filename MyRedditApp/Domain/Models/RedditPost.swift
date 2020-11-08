//
//  RedditPost.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class RedditPost: CustomStringConvertible {
    
    let id: String
    let username: String
    let domain: String
    let title: String
    let created: Date
    let imageUrl: String?
    let subreddit: String
    var ups: Int
    var downs: Int
    var numComments: Int
    var rating: Int {
        ups - downs
    }
    var saved: Bool
    
    init(id: String, username: String, domain: String, title: String, created: Date, imageUrl: String?, ups: Int, downs: Int, numComments: Int, subreddit: String) {
         self.id = id
         self.username = username
         self.domain = domain
         self.title = title
         self.created = created
         self.imageUrl = imageUrl
         self.ups = ups
         self.downs = downs
         self.numComments = numComments
         self.subreddit = subreddit
         self.saved = false
    }
    
    var description: String {
        """

        id: \(id)
        title: \(title)
        created: \(created)
        author: \(username)
        domain: \(domain)
        imageUrl: \(imageUrl?.description ?? "null")
        numComments: \(numComments)
        ups: \(ups)
        downs: \(downs)
        rating: \(rating)
        """
    }
}

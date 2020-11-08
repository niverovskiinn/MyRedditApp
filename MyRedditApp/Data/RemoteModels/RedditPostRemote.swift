//
//  RedditPostRemote.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import Foundation

class RedditPostRemote: Codable{
    
    let id: String
    let username: String
    let domain: String
    let title: String
    let created: Int
    let imageUrl: String?
    var ups: Int
    var downs: Int
    var numComments: Int
   
    
    private enum CodingKeys: String, CodingKey {
         case id
         case username = "author"
         case domain
         case title
         case created
         case imageUrl = "url"
         case ups
         case downs
         case numComments = "num_comments"
    }
    
    private enum AdditionalKeys: CodingKey{
        case data
    }
    
    
    
    init(id: String, username: String, domain: String, title: String, created: Int, imageUrl: String?, ups: Int, downs: Int, numComments: Int) {
         self.id = id
         self.username = username
         self.domain = domain
         self.title = title
         self.created = created
         self.imageUrl = imageUrl
         self.ups = ups
         self.downs = downs
         self.numComments = numComments
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AdditionalKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        self.title = try data.decode(String.self, forKey: .title)
        self.username = try data.decode(String.self, forKey: .username)
        self.domain = try data.decode(String.self, forKey: .domain)
        self.imageUrl = try data.decode(String.self, forKey: .imageUrl)
        self.id = try data.decode(String.self, forKey: .id)
        self.created = try data.decode(Int.self, forKey: .created)
        self.ups = try data.decode(Int.self, forKey: .ups)
        self.downs = try data.decode(Int.self, forKey: .downs)
        self.numComments = try data.decode(Int.self, forKey: .numComments)
    }
}

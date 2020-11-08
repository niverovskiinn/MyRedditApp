//
//  ViewController.swift
//  MyRedditApp
//
//  Created by   Никита on 08.11.2020.
//

import UIKit
import SDWebImage

class PostViewController: UIViewController {
    
   
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var postSubreddit: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var postRating: UILabel!
    @IBOutlet weak var postComments: UILabel!
    
    private let postViewModel = PostViewModel(redditPostUseCase: RedditPostUseCase(repository: RedditPostRepository(dbManager: PersistenceManager.shared, service: RedditPostService(httpRequester: HttpRequester.shared, persistenceManager: PersistenceManager.shared))))
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        postViewModel.getPost(from: "ios") { (post) in
            DispatchQueue.main.async {
                self.postTitle.text = post.title
                self.postUsername.text = post.username
                self.postSubreddit.text = post.subreddit
                self.postRating.text = post.rating.description
                self.postTime.text = post.created.description
                self.postComments.text = post.numComments.description
                
            }
            DispatchQueue.main.async {
                if let imageUrl = post.imageUrl{
                    self.postImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "LoadingImage"))
                } else {
                    self.postImage.image = UIImage(named: "PlaceholderImage")
                }
            }
        }
    }

    @IBAction func bookmarkAction(_ sender: Any) {
        if let post = postViewModel.post {
            bookmarkButton.isSelected = !bookmarkButton.isSelected
            post.saved = bookmarkButton.isSelected
        }
        
    }
    
}


//
//  PostService.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/11/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            create(forURLString: urlString, aspectHeight: aspectHeight, image: image)
            APIService.getVector(for: urlString)
        }
    }
    
    private static func create(forURLString urlString: String, aspectHeight: CGFloat, image: UIImage) {
        let post = Post(imageURL: urlString, imageHeight: aspectHeight)
        MLService.evaluateImage(for: image, post: post, completionHandler: { (post) in
            let dict = post.dictValue
            let postRef = Database.database().reference().child("posts").childByAutoId()
            postRef.updateChildValues(dict)
        })
    }
    
    static func posts(completion: @escaping ([Post]) -> Void) {
        let ref = Database.database().reference().child("posts")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let posts = snapshot.reversed().compactMap(Post.init)
            completion(posts)
        })
    }
}

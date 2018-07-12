//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/11/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
    
    // MARK: - Subviews
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    static let height: CGFloat = 46
    
    // MARK: - Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("like button tapped")
    }
}

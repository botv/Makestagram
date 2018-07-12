//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/11/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
}

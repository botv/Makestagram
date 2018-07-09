//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/9/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import UIKit

class CreateUsernameViewController : UIViewController {
    
    @IBOutlet weak var createUsernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        print("Hi")
    }
    
    
}

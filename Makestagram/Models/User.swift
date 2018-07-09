//
//  User.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/9/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    
    // MARK: Properties
    let uid: String
    let username: String
    
    init(uid: String, username: String){
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
            let username = dict["username"] as? String
            else {return nil}
        
        self.uid = snapshot.key
        self.username = username
    }
}

//
//  APIService.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/17/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct APIService {
    static func getVector(for imageURL: String) {
        let parameters: Parameters = [
            "imageURL": imageURL.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        ]
        
        print("performing query")
        
        Alamofire.request("https://api.benbotvinick.com/face", parameters: parameters).responseJSON() { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    let json = try! JSON(data: data)
                    print(json)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

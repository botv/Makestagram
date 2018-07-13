//
//  MLService.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/11/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import UIKit
import Firebase

struct MLService {
    static func evaluateImage(for uiImage: UIImage, post: Post, completionHandler: @escaping (_ post: Post) -> Void) {
        let options = VisionLabelDetectorOptions(
            confidenceThreshold: 0.5
        )
        
        let vision = Vision.vision()
        let labelDetector = vision.labelDetector(options: options)
        
        let visionImage = VisionImage(image: uiImage)
        
        labelDetector.detect(in: visionImage) { features, error in
            guard error == nil, let features = features, !features.isEmpty else {
                print("failure during classification, post not created")
                return
            }
            
            if features.count < 1 {
                post.tags.append("<no tags>")
                completionHandler(post)
            } else {
                let topResult = features[0]
                post.tags.append("\(topResult.label) - \(String(format: "%.3f", topResult.confidence * 100))%")
                completionHandler(post)
            }
        }
    }
}

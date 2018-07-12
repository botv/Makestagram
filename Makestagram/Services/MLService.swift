//
//  MLService.swift
//  Makestagram
//
//  Created by Ben Botvinick on 7/11/18.
//  Copyright © 2018 Ben Botvinick. All rights reserved.
//

import UIKit
import CoreML
import Vision

struct MLService {
    static func evaluateImage(for image: UIImage, post: Post, completionHandler: @escaping (_ post: Post) -> Void) {
        
        guard let image = CIImage(image: image) else {
            fatalError("Not able to convert UIImage to CIImage")
        }
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Can't load Inception ML model")
        }
        
        let request = VNCoreMLRequest(model: model, completionHandler: { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first else {
                    fatalError("Unexpected result type from VNCoreMLRequest")
            }
            
            post.tags.append(topResult.identifier)
            completionHandler(post)
        })
        
        // Run the Core ML model classifier on global dispatch queue
        let handler = VNImageRequestHandler(ciImage: image)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
    }
}

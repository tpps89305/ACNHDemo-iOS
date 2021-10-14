//
//  Extensions.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/6/30.
//

import Foundation
import UIKit
import Alamofire

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadUrl(url: String, onLoadingCompleted loadingCompleted: (() -> Void)? = nil) {
        if let image = imageCache.object(forKey: url as NSString) as? UIImage {
            self.image = image
            loadingCompleted?()
            return
        }
        
        AF.request(url).response { response in
            if let data = response.data {
                let image = UIImage(data: data)!
                imageCache.setObject(image, forKey: url as NSString)
                self.image = image
                loadingCompleted?()
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
    }
    
}

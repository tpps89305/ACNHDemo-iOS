//
//  Extensions.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/6/30.
//

import Foundation
import UIKit
import Alamofire

var imageCahce = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadUrl(url: String, cell: VillagersTableViewCell) {
        if let image = imageCahce.object(forKey: url as NSString) as? UIImage {
            self.image = image
            return
        }
        
        AF.request(url).response { response in
            if let data = response.data {
                let image = UIImage(data: data)!
                imageCahce.setObject(image, forKey: url as NSString)
                self.image = image
                cell.setNeedsLayout()
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
    }
    
}

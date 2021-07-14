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
    
    func loadUrl(url: String, onLoadingCompleted loadingCompleted: @escaping () -> Void) {
        if let image = imageCahce.object(forKey: url as NSString) as? UIImage {
            self.image = image
            loadingCompleted()
            return
        }
        
        AF.request(url).response { response in
            if let data = response.data {
                let image = UIImage(data: data)!
                imageCahce.setObject(image, forKey: url as NSString)
                self.image = image
                loadingCompleted()
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
    }
    
}

func hexStringToUIColor (hex: String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

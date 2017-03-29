//
//  Extensions.swift
//  MovieStatus
//
//  Created by xszhao on 2017-03-25.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

//create a cache using NSCache
let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    var imageUrlString: String?
    func loadImageUsingUrlString(_ urlString: String) {
        print("loadImageUsingUrlString!:")
        print(urlString)
        
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        
        print("The current url is: ")
        print(url)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                let imageToCache = UIImage(data: data!)
                
                //let imageName = "taylor_swift_profile.png"
                //let image = UIImage(named: imageName)
                //print("image: ")
                //print(image)
                //let imageView = UIImageView(image: image!)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                //if urlString == "https://image.tmdb.org/t/p/w500/xzbAey8RrRNKOe6JZMuxbIRc1UE.jpg" || urlString == "https://image.tmdb.org/t/p/w500/4cJv0cghFaJfepzGdOyqeNaJWYb.jpg" {
                    //add imageView to imageCache
                    //imageCache.setObject(imageView, forKey: urlString as AnyObject)
                //}
                //else {
                    //if (imageToCache != nil) {
                        imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    //}
                //}
                
            })
        }).resume()
    }
}

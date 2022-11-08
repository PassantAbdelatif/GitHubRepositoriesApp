//
//  UIImageViewExtension.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation
import Kingfisher

//extension UIImageView {
//
//    func loadImageFromUrl(_ urlStr: String?,
//                          placeholderImage: UIImage? = nil,
//                          completion: (() -> Void)? = nil) {
//        if let url = URL(string: urlStr?.toURLString() ?? "") {
//            self.kf.setImage(with: url,
//                             placeholder: placeholderImage) { _ in
//                                completion?()
//            }
//        }
//    }
//}

extension UIImageView {
    func loadImageFromUrl(_ urlStr: String?,
                          placeholderImage: UIImage? = nil) {
        if let urlStr = urlStr,
           !urlStr.isEmpty {
            
            self.image = placeholderImage
            guard let url = URL(string: urlStr) else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                if let imageData = try? Data(contentsOf: url) {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }

        }).resume()
    }
}

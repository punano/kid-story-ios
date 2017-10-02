//
//  CommonUtility.swift
//  angia
//
//  Created by Quang Pham on 8/19/17.
//  Copyright © 2017 Quang Pham. All rights reserved.
//

import UIKit

class CommonUtility {
    static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    static func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    static func topView() -> UIViewController? {
        
        if var topVC = UIApplication.shared.keyWindow?.rootViewController {
            while topVC.presentedViewController != nil {
                topVC = topVC.presentedViewController!
            }
            return topVC
        }
        return nil
    }
    
    static func getScreenshotOfView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageData = UIImageJPEGRepresentation(image!, 0.75)
        image = UIImage(data: imageData!)
        return image!
    }
    
    static func resizeImage(image: UIImage?, size: CGSize) -> UIImage? {
        if let sourceImage = image {
            var newImage: UIImage = UIImage()
            let imageSize = sourceImage.size
            let width = imageSize.width
            let height = imageSize.height
            
            let targetWidth = size.width
            let targetHeight = size.height
            
            var scaleFactor: CGFloat = 0
            var scaleWidth = targetWidth
            var scaleHeight = targetHeight
            
            var thumbPoint = CGPoint.zero
            if !size.equalTo(imageSize) {
                let widthFactor = targetWidth / width
                let heightFactor = targetHeight / height
                
                if widthFactor < heightFactor {
                    scaleFactor = widthFactor
                } else {
                    scaleFactor = heightFactor
                }
                
                scaleWidth = scaleFactor * width
                scaleHeight = scaleFactor * height
                
                if widthFactor < heightFactor {
                    thumbPoint.y = (targetHeight - scaleHeight) * 0.5
                } else {
                    thumbPoint.x = (targetWidth - scaleWidth) * 0.5
                }
            }
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            
            var thumbRect = CGRect.zero
            thumbRect.origin = thumbPoint
            thumbRect.size.width = scaleWidth
            thumbRect.size.height = scaleHeight
            
            sourceImage.draw(in: thumbRect)
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
            
        } else {
            return nil
        }
    }
    
    static func resizeImageName(image: String?, size: CGSize) -> UIImage? {
        if image == nil {
            return nil
        }
        if let sourceImage = UIImage(named: image!) {
            var newImage: UIImage = UIImage()
            let imageSize = sourceImage.size
            let width = imageSize.width
            let height = imageSize.height
            
            let targetWidth = size.width
            let targetHeight = size.height
            
            var scaleFactor: CGFloat = 0
            var scaleWidth = targetWidth
            var scaleHeight = targetHeight
            
            var thumbPoint = CGPoint.zero
            if !size.equalTo(imageSize) {
                let widthFactor = targetWidth / width
                let heightFactor = targetHeight / height
                
                if widthFactor < heightFactor {
                    scaleFactor = widthFactor
                } else {
                    scaleFactor = heightFactor
                }
                
                scaleWidth = scaleFactor * width
                scaleHeight = scaleFactor * height
                
                if widthFactor < heightFactor {
                    thumbPoint.y = (targetHeight - scaleHeight) * 0.5
                } else {
                    thumbPoint.x = (targetWidth - scaleWidth) * 0.5
                }
            }
            
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            
            var thumbRect = CGRect.zero
            thumbRect.origin = thumbPoint
            thumbRect.size.width = scaleWidth
            thumbRect.size.height = scaleHeight
            
            sourceImage.draw(in: thumbRect)
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
            
        } else {
            return nil
        }
    }
    
    static func deviceId() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}

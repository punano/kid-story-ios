//
//  ColorExtension.swift
//  angia
//
//  Created by Quang Pham on 8/19/17.
//  Copyright © 2017 Quang Pham. All rights reserved.
//

import UIKit

extension UIColor {
    static func UIColorFromRGB(_ rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    static var globalColor: UIColor {
        return UIColorFromRGB(0xff7158)
    }
    
    static var globalBackgroundColor: UIColor {
        return UIColorFromRGB(0x1b2f39)
    }
    
    static var tabbarSelectedColor: UIColor {
        return UIColorFromRGB(0xffffff)
    }
    
    static var darkGrayTextColor: UIColor {
        return UIColorFromRGB(0x525252)
    }
    
    static var greenSelectedColor: UIColor {
        return UIColorFromRGB(0x4CD964)
    }
}

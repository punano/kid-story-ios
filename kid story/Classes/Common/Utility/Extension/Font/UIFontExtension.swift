//
//  UIFontExtension.swift
//  angia
//
//  Created by Quang Pham on 8/19/17.
//  Copyright © 2017 Quang Pham. All rights reserved.
//

import UIKit

extension UIFont {
    static func tabbarFont() -> UIFont {
        return openSansRegular(size: 8)
    }
    
    static func openSansRegular(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-Regular", size: size)!
        return font
    }
    
    static func openSansLight(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-Light", size: size)!
        return font
    }
    
    static func openSansLightItalic(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-LightItalic", size: size)!
        return font
    }
    
    static func openSansBold(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-Bold", size: size)!
        return font
    }
    
    static func openSansBoldItalic(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-BoldItalic", size: size)!
        return font
    }
    
    static func openSansExtraBold(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-ExtraBold", size: size)!
        return font
    }
    
    static func openSansExtraBoldItalic(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-ExtraBoldItalic", size: size)!
        return font
    }
    
    static func openSansItalic(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-Italic", size: size)!
        return font
    }
    
    static func openSansSemiBold(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-SemiBold", size: size)!
        return font
    }
    
    static func openSansSemiBoldItalic(size: CGFloat) -> UIFont {
        let font = UIFont(name: "OpenSans-SemiBoldItalic", size: size)!
        return font
    }
    
}

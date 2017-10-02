//
//  ViewExtension.swift
//  kid story
//
//  Created by Gà Nguy Hiểm on 10/2/17.
//  Copyright © 2017 pandabox. All rights reserved.
//

import UIKit

extension UIView{
    func createdDropdownShadow(shadowColor: UIColor, radius: CGFloat, size: CGFloat, opacity: Float){
        //shadow
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: size)
        self.layer.shadowRadius = radius
    }
}

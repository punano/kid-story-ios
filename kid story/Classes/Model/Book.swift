//
//  Book.swift
//  kid story
//
//  Created by Gà Nguy Hiểm on 10/2/17.
//  Copyright © 2017 pandabox. All rights reserved.
//

import UIKit

class Book: NSObject {
    var name: String = ""
    var cover: UIImage = UIImage(named: "no-cover.png")!
    
    init(name: String){
        self.name = name
        if let img = UIImage(named: "\(name).jpeg"){
            self.cover = img
        }
    }
}

//
//  BookSelectCell.swift
//  kid story
//
//  Created by Gà Nguy Hiểm on 10/2/17.
//  Copyright © 2017 pandabox. All rights reserved.
//

import UIKit

class BookSelectCell: UICollectionViewCell {
    
    @IBOutlet var labelBookName: UILabel!
    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(book: Book) {
        self.labelBookName.text = book.name
        self.imageCover.image = book.cover
    }

}

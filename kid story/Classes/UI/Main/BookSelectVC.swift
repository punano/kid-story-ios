//
//  ViewController.swift
//  kid story
//
//  Created by Gà Nguy Hiểm on 10/2/17.
//  Copyright © 2017 pandabox. All rights reserved.
//

import UIKit

class BookSelectVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    var normalSize = CGSize(width: 0, height: 0)
    var expandSize = CGSize(width: 0, height: 0)
    
    private let cellId = "bookCell"
    //
    
    var listBook:[Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        // Do any additional setup after loading the view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setupData() {
        let arrayBook = [
            "Cinderella",
            "Goldilocks and the Three Bears",
            "Hansel and Gretel",
            "Jack and the Beanstalk",
            "Little Red Riding Hood",
            "Puss in Boots",
            "The Ant and the Grasshopper",
            "The Emperor's New Clothes",
            "The Princess and the Pea",
            "The Ugly Duckling"
        ]
        for string in arrayBook {
            let book = Book(name: string)
            listBook.append(book)
        }
    }
    
    func setupView() {
        //main view
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(UINib(nibName: "BookSelectCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        
        normalSize = CGSize(width: mainCollectionView.frame.size.width*0.51, height: mainCollectionView.frame.size.height*0.65)
        expandSize = CGSize(width: normalSize.width*1.1, height: normalSize.height*1.1)
    }
    
    //for animation
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if mainCollectionView.indexPathsForVisibleItems.count > 0 {
                let centerPoint = self.view.convert(self.view.center, to: self.mainCollectionView)
                if let  index = self.mainCollectionView.indexPathForItem(at: centerPoint) {
                    for cell in mainCollectionView.visibleCells {
                        if mainCollectionView.indexPath(for: cell) != index{
                            UIView.animate(withDuration: 0.1, delay: 0.0, animations: {
                                cell.frame.size = self.normalSize
                                cell.alpha = 0.5
                            }, completion: nil)
                        }else{
                            UIView.animate(withDuration: 0.1, delay: 0.0, animations: {
                                cell.frame.size = self.expandSize
                                cell.alpha = 1.0
                            }, completion: nil)
                        }
                    }
                }
                
            }
    }
    
    //collection view delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBook.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = listBook[indexPath.row]
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BookSelectCell
        if indexPath.row == 0 {
            cell.frame.size = expandSize
        } else {
            cell.alpha = 0.5
        }
        cell.setData(book: item)
        cell.mainView.createdDropdownShadow(shadowColor: UIColor.black, radius: 6, size: 2, opacity: 0.4)
        return cell
        
        //for animation
        //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //
        //        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return self.normalSize
    }
    
    //space first item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Add inset to the collection view if there are not enough cells to fill the width.
            return UIEdgeInsets(top: 0.0, left:SCREEN_SIZE.width/5, bottom: 0.0, right: SCREEN_SIZE.width/5)
    }
    
    //space each itme
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return SCREEN_SIZE.width/22
    }
}


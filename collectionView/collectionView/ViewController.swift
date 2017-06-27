//
//  ViewController.swift
//  collectionView
//
//  Created by rishabh.yadav on 6/27/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    let array:[String] = ["1","2","3","4","5","6","7","1","2","3","4","5","6","7","1","2","3","4","5","6","7","1","2","3","4","5","6","7","1","2","3","4","5","6","7","1","2","3","4","5","6","7","1","2","3","4","5","6","7","1","2","3","4","5","6","7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/3 - 2
        
        let layout = UICollectionViewFlowLayout()
      //  layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        myCollectionView.collectionViewLayout = layout
    }

    
    //number of views(number of boxes)
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return array.count
    }
    
    //populate views
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! MyCell
        
        cell.myImageView.image = UIImage(named: array[indexPath.row])
        
        return cell
    }


}


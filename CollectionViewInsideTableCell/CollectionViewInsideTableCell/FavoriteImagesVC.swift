//
//  FavoriteImagesVC.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 08/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class FavoriteImagesVC: UIViewController {

    @IBOutlet weak var favImagesCollectionView: UICollectionView!
    
    var imageArray = [URL]()
    var fullImageArray = [URL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favImagesCollectionView.dataSource = self
        favImagesCollectionView.delegate = self
        
        let carsCollectionViewCellNib = UINib(nibName: "CarsCollectionViewCell", bundle: nil)
        favImagesCollectionView.register(carsCollectionViewCellNib, forCellWithReuseIdentifier: "CarsCollectionViewCellID")
    }
    
}

extension FavoriteImagesVC: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let favCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarsCollectionViewCellID", for: indexPath) as! CarsCollectionViewCell
        
        favCollectionCell.populatedData(imageArray[indexPath.item])
        favCollectionCell.favImgBtn.isHidden = true
        return favCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        let fullImageNavigation = storyBoardScene.instantiateViewController(withIdentifier: "ShowingFullImageVC_ID") as! ShowingFullImageVC
        self.navigationController?.pushViewController(fullImageNavigation, animated: true)
        
        
        let url = self.fullImageArray[indexPath.item]
        
        fullImageNavigation.imageURL = "\(url)"
    }
    
}

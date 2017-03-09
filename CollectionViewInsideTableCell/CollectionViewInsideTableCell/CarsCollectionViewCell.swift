//
//  CarsCollectionViewCell.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 06/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CarsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var favImgBtn: UIButton!
    @IBOutlet weak var showingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populatedData(_ information: [String:String]) {
        let imageInfo = information["ImageUrl"]
        showingImage.backgroundColor = UIColor(patternImage: UIImage(named: imageInfo!)!)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        favImgBtn.isSelected = false
    }
    
}


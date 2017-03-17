//
//  CarsCollectionViewCell.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 06/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import AlamofireImage

class CarsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var favImgBtn: UIButton!
    @IBOutlet weak var showingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populatedData(_ url: URL) {
    
        showingImage.af_setImage(withURL : url)
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        favImgBtn.isSelected = false
    }
    
}


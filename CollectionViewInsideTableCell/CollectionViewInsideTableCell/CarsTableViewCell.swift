//
//  CarsTableViewCell.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 06/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CarsTableViewCell: UITableViewCell {

    @IBOutlet weak var carsCollectionView: UICollectionView!
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        carsCollectionView.reloadData()
    }
}

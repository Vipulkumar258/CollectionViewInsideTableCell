//
//  Generics.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 07/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
     func getCollectionCellSuperview() -> UICollectionViewCell {
        
        var cell = self
        
        while !(cell is UICollectionViewCell) {
            
            cell = cell.superview!
        }
        return cell as! UICollectionViewCell
    }
    
    func getTableCellSuperview() -> UITableViewCell {
        
        var cell = self
        
        while !(cell is UITableViewCell) {
            
            cell = cell.superview!
        }
        return cell as! UITableViewCell
    }
    
}
 

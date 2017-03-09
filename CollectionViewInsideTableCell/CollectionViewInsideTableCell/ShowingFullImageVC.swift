//
//  ShowingFullImageVC.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 07/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ShowingFullImageVC: UIViewController {
    
    @IBOutlet weak var fullImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var centerX = CGFloat()
    var centerY = CGFloat()
    
    var info = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fullImage.backgroundColor = UIColor(patternImage: UIImage(named: info)!)
    
        label.text = "" + info
        
        centerX = fullImage.center.x
        centerY = fullImage.center.y
    
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(detectPan))
        
        fullImage.addGestureRecognizer(panGesture)
        
        fullImage.isUserInteractionEnabled = true
    }
    
    func populatedData(_ information: [String:String]) {

        let imageInfo = information["ImageUrl"]
        
        info = imageInfo!
    
    }
    
    func detectPan(_ recognizer: UIPanGestureRecognizer) {
    
        let translation = recognizer.translation(in: fullImage.superview)
        
        if recognizer.state == .began || recognizer.state == .changed || recognizer.state == .ended {
            
            fullImage.center = CGPoint(x: centerX + translation.x, y: centerY + translation.y)

        }
        
        if recognizer.state == .ended {
            
            centerX = fullImage.center.x
            centerY = fullImage.center.y

        }
        
    }
    
    
    
}

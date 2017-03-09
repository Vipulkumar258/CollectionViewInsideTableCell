//
//  CarsVC.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 06/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CarsVC: UIViewController {
    
    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var viewContainingIcon: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var backgroundViewTop: UIView!
    let headerTitle = ["Cars","Trucks","Bikes"]
    var sectionArray: [Int] = []
    var favImgArrayToSend: [Int] = []
    var clickedBtn: [IndexPath] = []
    let image = ImageData()
    var favArray = [[IndexPath]]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        carsTableView.dataSource = self
        carsTableView.delegate = self
        
        imageIcon.clipsToBounds = true
        imageIcon.layer.cornerRadius = 50
        
        viewContainingIcon.layer.cornerRadius = 50
        
        backgroundViewTop.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      
        //registering the TableCell Nib
        let carsTableViewCellNib = UINib(nibName: "CarsTableViewCell", bundle: nil)
        carsTableView.register(carsTableViewCellNib, forCellReuseIdentifier: "CarsTableViewCellID")
        
        //registering the CollectionCell Nib
        let headerViewNib = UINib(nibName: "HeaderView", bundle: nil)
        carsTableView.register(headerViewNib, forHeaderFooterViewReuseIdentifier: "HeaderViewID")
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    //check all favourite images in a separate view controller
    @IBAction func favImageShowBtn(_ sender: UIButton) {
        
        let StoryBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let favImagesNavigation = StoryBoardScene.instantiateViewController(withIdentifier: "FavoriteImagesVC_ID") as! FavoriteImagesVC
        
        favImagesNavigation.imageArray = favImgArrayToSend
        
        print(favImgArrayToSend)
        
        self.navigationController?.pushViewController(favImagesNavigation, animated: true)
    
    }
}

extension CarsVC: UITableViewDataSource, UITableViewDelegate {
    
    //Number Of sections in tableview
    func numberOfSections(in tableView: UITableView) -> Int {

        return 3
    
    }
    
    //Number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if sectionArray.contains(section) {
            
            return 0
            
        } else {
        
            return 4
        }
    }
    
    //height of rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
    }
    
    //Cells in a row of tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let carsTableCell = tableView.dequeueReusableCell(withIdentifier: "CarsTableViewCellID", for: indexPath) as! CarsTableViewCell
        
        let carsCollectionViewCellNib = UINib(nibName: "CarsCollectionViewCell", bundle: nil)
        carsTableCell.carsCollectionView.register(carsCollectionViewCellNib, forCellWithReuseIdentifier: "CarsCollectionViewCellID")
        
        carsTableCell.carsCollectionView.dataSource = self
        carsTableCell.carsCollectionView.delegate = self
        
        carsTableCell.indexPath = indexPath
        
        return carsTableCell
    }
    
    //height of header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    //view of header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerViewObj = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewID") as! HeaderView
        headerViewObj.contentView.backgroundColor = UIColor.black
        
        headerViewObj.headerLabel.text = "\(headerTitle[section])"
        headerViewObj.toggleHideShowBtn.tag = section
        
        if sectionArray.contains(section) {

            headerViewObj.toggleHideShowBtn.isSelected = true
        
        } else {
        
            headerViewObj.toggleHideShowBtn.isSelected = false
        
        }
        
        headerViewObj.toggleHideShowBtn.addTarget(self, action: #selector(self.toggleBtnClicked(sender:)), for: .touchUpInside)
        
        return headerViewObj
    }
    
    //to hide/show a section after tap on button
    func toggleBtnClicked(sender: UIButton) {
        
        let clickedSection = sender.tag
        
        if sectionArray.contains(clickedSection) {
            
            sectionArray.remove(at: sectionArray.index(of: clickedSection)!)
            
        } else {
            
            sectionArray.append(clickedSection)
        }
        
        carsTableView.reloadData()
    }
    
    //favourite button
    func favBtnClicked(sender: UIButton) {
        
        favImgArrayToSend.append(sender.tag)
        let tableCell = sender.getTableCellSuperview() as! CarsTableViewCell
        let collectionCell = sender.getCollectionCellSuperview() as! CarsCollectionViewCell
        
        //finding table view cell index path
        let tableCellIndexPath = carsTableView.indexPath(for: tableCell)!
        
        // finding collection view cell index path
        let clickedFavBtnCellIndexPath = tableCell.carsCollectionView.indexPath(for: collectionCell)!

        if sender.isSelected {
      
            sender.isSelected = false
          
            favArray.remove(at: favArray.index(where: { (indices : [IndexPath]) -> Bool in
               
            return indices == [tableCellIndexPath,clickedFavBtnCellIndexPath]
            })!)
        
        } else {
            
            sender.isSelected = true
            
            favArray.append([tableCellIndexPath,clickedFavBtnCellIndexPath])
        }
        
        print("table view cell index path  ", carsTableView.indexPath(for: tableCell)!)
        print("collection view cell index path  ", clickedFavBtnCellIndexPath)
        print("favorite image array   ", favArray)
    }
}

extension CarsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let carsCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarsCollectionViewCellID", for: indexPath) as! CarsCollectionViewCell
        
        carsCollectionCell.favImgBtn.tag = indexPath.item
        
        carsCollectionCell.favImgBtn.addTarget(self, action: #selector(self.favBtnClicked(sender:)), for: .touchUpInside)
        carsCollectionCell.populatedData(image.imageInfo[indexPath.item] as [String:String])
        
        let tableCell = collectionView.getTableCellSuperview() as! CarsTableViewCell

        if favArray.contains(where: { (indices: [IndexPath]) -> Bool in
            return indices == [tableCell.indexPath,indexPath]
        }) {
            carsCollectionCell.favImgBtn.isSelected = true
        } else {
            carsCollectionCell.favImgBtn.isSelected = false
        }
        
        return carsCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
        let fullImageNavigation = storyBoardScene.instantiateViewController(withIdentifier: "ShowingFullImageVC_ID") as! ShowingFullImageVC
        self.navigationController?.pushViewController(fullImageNavigation, animated: true)
        fullImageNavigation.populatedData(image.imageInfo[indexPath.item] as [String:String])
        
        print(indexPath)
        print(indexPath.row)
        
    }
}

//
//  ImagesModel.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 10/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

struct ImagesModel {
    
    let id : String!
    var comments = 0
    var downloads = 0
    var favorites = 0
    var likes = 0
    var views = 0
    var pageURL : String = ""
    var userImageURL : String = ""
    var previewWidth: Int = 0
    var imageWidth: Int = 0
    var webformatURL: String = ""
    var previewURL: String = ""
    var imageData : JSON?  = []
    
    init(withJSON json: JSON) {
        
        self.id = json["id"].stringValue
        self.comments = json["comments"].intValue
        self.downloads = json["downloads"].intValue
        self.favorites = json["favorites"].intValue
        self.likes = json["likes"].intValue
        self.views = json["views"].intValue
        self.pageURL = json["pageURL"].stringValue
        self.userImageURL = json["userImageURL"].stringValue
        self.webformatURL = json["webformatURL"].stringValue
        self.previewURL = json["previewURL"].stringValue
        
    }
    
}

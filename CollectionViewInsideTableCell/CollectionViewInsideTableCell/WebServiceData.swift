//
//  WebServiceData.swift
//  CollectionViewInsideTableCell
//
//  Created by Appinventiv on 10/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebServicesData {
    
    var imagesArray = [JSON]()
    var carArray = [JSON]()
    
    
    func fetchDataFromPixabay(withQuery query: String,
                              page: Int,
                              success : @escaping (([ImagesModel]) -> Void),
                              failure : @escaping ((Error) -> Void)) {
        
        let url =  "https://pixabay.com/api/"
        let param = ["key" : "4770218-3165926874c8f0fad4783188d", "q" : query, "page" : page] as [String : Any]
        
        
        NetWorkController().GET(URL: url,
                                parameters : param,
                                success : { (json : JSON) in
                                    
                                    
                                     self.imagesArray = json["hits"].arrayValue
//                                    print(self.imagesArray)
                                    
                                    var imageModels = [ImagesModel]()
                                    
                                    for image in self.imagesArray {
                                        
                                        imageModels.append(ImagesModel(withJSON: image))
                                    }
                                    
                                    success(imageModels)
                                    
        }, failure : { (error : Error) in
            
            failure(error)
        })
        
    }
}

//
//  TableViewCellModel.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/18.
//

import Foundation
import UIKit


class TableViewCellModel {
    var dataList = NSMutableArray()
    let dataContainer = DataContainer()
    let network = CcNetwork()
    func getPhotoItem(index : Int) -> NSDictionary {
        let curData = dataList.object(at: index)
        let encodeData = dataContainer.photosData_Encodable(data: curData as! PhotoData)
        return encodeData
    }
    

    func downLoadImage(url : String, completion: @escaping (UIImage?) -> Void) {
        network.checkCache(url: url) { (cacheImage) in
            guard let image = cacheImage else {
                self.network.downLoadImage(url: url) { (image) in
                    completion(image)
                }
                return
                
            }
            completion(image as? UIImage)
        }
//        network.checkCache(key: url) { (imageData) in
////            guard let image = UIImage(data: imageData as Data) else { return }
////            completion(image)
//        }
        
    }
    
    
}

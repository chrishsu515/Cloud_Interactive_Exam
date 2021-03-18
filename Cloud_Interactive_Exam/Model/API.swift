//
//  API.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/17.
//

import Foundation
let domainName = "https://jsonplaceholder.typicode.com"
let apiGetPhotos = "\(domainName)/photos"

//struct PhotoData:Codable {
//    var albumId : Int
//    var id : Int
//    var thumbnailUrl : String
//    var title : String
//    var url : String
//}

class API {
    let network = CcNetwork()
    let dataContainer = DataContainer()
    func getPhotos(completionHandler: @escaping (Array<Any>?) -> Void) {
        network.request { (res) in
            let data = self.dataContainer.photosData_Decodable(dataArray: res)
//            debugPrint(data)
            completionHandler(data)
        }
    }
}

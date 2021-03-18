//
//  DataContainer.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/17.
//

import Foundation

struct PhotoData:Codable {
    var albumId : Int = 0
    var id : Int
    var thumbnailUrl : String
    var title : String
    var url : String
}


class DataContainer {
    
    func photosData_Decodable(dataArray: NSArray?) -> [PhotoData] {
        
        var returnData : Array<PhotoData> = []
        for item in dataArray! {
            let dict = item as! NSDictionary
            let jsonData: Data = try!  JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
            let decoder = JSONDecoder()
            let result = try! decoder.decode(PhotoData.self, from: jsonData)
            returnData.append(result)
       }
        return returnData
    }
    func photosData_Encodable(dataArray: [PhotoData]?) -> Array<Any> {
        
        var returnData = Array<Any>()
        for item in dataArray! {
            let encoder = JSONEncoder()
            let data = try! encoder.encode(item)
            let encodedData = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            returnData.append(encodedData)
       }
        return returnData
    }
    
    func photosData_Encodable(data: PhotoData) -> NSDictionary {
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(data)
        let encodedData : NSDictionary = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        
        return encodedData
    }
    
}

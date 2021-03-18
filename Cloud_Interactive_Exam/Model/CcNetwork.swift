//
//  Network.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/17.
//

import Foundation
import Alamofire
import AlamofireImage


class CcNetwork {
    private var cache = NSCache<AnyObject, AnyObject>()

    
    func request(completion: @escaping (NSArray?) -> Void) {
        
        AF.request(apiGetPhotos).responseJSON { (res) in
            completion(res.value as? NSArray)
        }
    }
    
    func downLoadImage(url : String, completion: @escaping (UIImage?) -> Void) {
        AF.request(url).responseImage { response in

            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                self.cache.setObject(image, forKey: url as AnyObject)
                completion(image)
                
            }
        }
    }
    
    
    func checkCache<T>(url : T, completion: @escaping (T?) -> Void) {
        let image = self.cache.object(forKey: url as AnyObject)
        guard let cacheData = image else {
            completion(nil)
            return
            
        }
        print("cache here")
//        completion(cacheData as? T)
        DispatchQueue.main.async {
            completion(cacheData as? T)

        }
        
    }
}



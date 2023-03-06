//
//  APIManager.swift
//  NasaImages TestProject
//
//  Created by TL-1 on 06/03/23.
//

import Foundation
import SwiftyJSON
import Alamofire


class APICallingManager : NSObject {
    
    static let shared = APICallingManager()
    
    func getPictures(_ complition : @escaping(([PicturesModel]?)->())){
        AF.request(MAIN_API, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseData { dataResponse in
                switch dataResponse.result {
                case .failure( let error) :
                    print(error.localizedDescription)
                    complition(nil)
                case .success(let data) :
                    do {
                        let array = try JSONDecoder().decode(ProductModel.self, from: data)
                        complition(array.products)
                    }catch{
                        print(error.localizedDescription)
                        complition(nil)
                    }
                }
            }
    }
}

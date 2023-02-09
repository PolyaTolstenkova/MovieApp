//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.10.2022.
//

import Foundation
import Alamofire

class DataManager {
    
    func fetchData<T: Decodable>(
        url: String,
        dataType: T.Type,
        completion: @escaping (T?, Error?) -> Void
    ) {
        AF.request(url, parameters: nil, headers: nil)
        .validate(statusCode: 200 ..< 300)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
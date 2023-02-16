//
//  MovieManager.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.10.2022.
//

import Foundation
import Alamofire

class DataManager<T: Decodable> {
    
    let token: String
    let headers: HTTPHeaders
    
    init(token: String) {
        self.token = token
        self.headers = [.authorization(bearerToken: token)]
    }
    
    func fetchData(
        url: String,
        completion: @escaping (T?, Error?) -> Void
    ) {
        AF.request(url, headers: headers)
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

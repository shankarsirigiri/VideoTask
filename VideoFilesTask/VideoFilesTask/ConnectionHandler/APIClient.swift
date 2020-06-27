//
//  Constants.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//

import Alamofire


class APIClient {
    // MARK: - Perform Request
   @discardableResult
   private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
       return AF.request(route)
                       .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                        completion(response.result)
       }
   }
    
    // MARK: - AllVideos Request
    static func getAllVideos(offset: Int, page: Int, completion:@escaping (Result<[VideoObject], AFError>)->Void) {
        performRequest(route: APIRouter.getAllVideos(offset: offset, page: page), completion: completion)
    }
    

}

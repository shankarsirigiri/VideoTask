//
//  Constants.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//

import Alamofire

enum APIRouter: APIConfiguration {

    case getAllVideos(offset:Int, page: Int )
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getAllVideos:
            return .get

        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .getAllVideos(let offset, let page):
              return "?offset=\(offset)" + "&" + "limit=\(page)"
       
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .getAllVideos:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let urlStr = Constants.ProductionServer.baseURL + path
        let url = try urlStr.asURL()
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                // Common Headers
               // urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

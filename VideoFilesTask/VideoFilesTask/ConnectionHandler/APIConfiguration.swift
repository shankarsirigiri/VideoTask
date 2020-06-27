//
//  Constants.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

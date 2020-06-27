//
//  Constants.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//
import Foundation

struct Constants {
    struct ProductionServer {
         static let baseURL = "https://qgkpjarwfl.execute-api.us-east-1.amazonaws.com/dev/getNormalVideoFiles"
        
    }
}

enum HTTPHeaderField: String {
    case authentication = "x-api-key"

}

enum ContentType: String {
    case json = "jvmNAyPNr1JhiCeUlYmB2ae517p3Th0aGG6syqMb"
}

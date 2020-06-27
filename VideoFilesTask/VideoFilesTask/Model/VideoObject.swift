//
//  VideoObject.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//
import Foundation

// MARK: - VideoObject
struct VideoObject: Codable {
    let dateTime, status: String
    let thumbnail: String
    let fileSize: String
    let id: Int
}



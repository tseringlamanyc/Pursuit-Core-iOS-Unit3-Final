//
//  AppError.swift
//  Elements
//
//  Created by Tsering Lama on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case encodingError(Error)
    case badStatusCode(Int)
    case badMimeType(String)
    
    var description: String {
        return "AppError: \(self)"
    }
}

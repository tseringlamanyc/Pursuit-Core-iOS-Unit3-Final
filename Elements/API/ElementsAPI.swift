//
//  ElementsAPI.swift
//  Elements
//
//  Created by Tsering Lama on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct ElementsAPI {
    
    static func getElements(completionHandler: @escaping (Result<[AllElements], AppError>)-> ()) {
        
        let elementEndpoint = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: elementEndpoint) else {
            completionHandler(.failure(.badURL(elementEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let elementsArr = try JSONDecoder().decode([AllElements].self, from: data)
                    completionHandler(.success(elementsArr))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    static func postElements(favElement: AllElements, completionHandler: @escaping (Result<Bool,AppError>) -> ()) {
        
        let postEndpoint = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: postEndpoint) else {
            completionHandler(.failure(.badURL(postEndpoint)))
            return
        }
        
        do {
            let data = try JSONEncoder().encode(favElement)
            var request = URLRequest(url: url)
            request.httpBody = data
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completionHandler(.failure(.networkClientError(appError)))
                case .success(_):
                    completionHandler(.success(true))
                }
            }
        } catch {
            completionHandler(.failure(.encodingError(error)))
        }
    }
    
    static func getFavorites(completionHandler: @escaping (Result<[AllElements], AppError>) -> ()) {
        
        let getEndpoint = "http://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: getEndpoint) else {
            completionHandler(.failure(.badURL(getEndpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let favorites = try JSONDecoder().decode([AllElements].self, from: data)
                    completionHandler(.success(favorites))
                } catch {
                    completionHandler(.failure(.decodingError(error)))
                }
            }
        }
    }
}

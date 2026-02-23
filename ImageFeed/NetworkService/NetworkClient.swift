//
//  NetworkClient.swift
//  ImageFeed
//
//  Created by Ильман on 22.02.2026.
//

import Foundation

protocol NetworkClientProtocol {
    func fetchOauthToken(from request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkClient: NetworkClientProtocol {
    
    func fetchOauthToken(from request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.data(for: request) { result in
            switch result {
            case .success(let data):
                do {
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
}

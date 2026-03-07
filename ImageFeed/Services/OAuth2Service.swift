//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Ильман on 23.02.2026.
//

import Foundation

final class OAuth2Service {

    static let shared = OAuth2Service()

    private init() {}

    private func makeOAuthTokenRequest(code: String) -> URLRequest? {
        var urlComponents = URLComponents(string: WebViewConstants.unsplashAuthorizeTokenURLString)
        urlComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "client_secret", value: Constants.secretKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code")
        ]
        guard let url = urlComponents?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }

    func fetchToken(
        code: String,
        completion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void
    ) {
        guard let urlRequest = makeOAuthTokenRequest(code: code) else { return }

        let task = URLSession.shared.data(for: urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                do {
                    let tokenData = try decoder.decode(OAuthTokenResponseBody.self, from: data)
                    completion(.success(tokenData))
                } catch {
                    completion(.failure(error))
                    print(error)
                }

            case .failure(let error):
                completion(.failure(error))
                print(error)
            }
        }
        task.resume()
    }
}

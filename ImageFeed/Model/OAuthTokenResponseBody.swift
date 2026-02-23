//
//  Token.swift
//  ImageFeed
//
//  Created by Ильман on 19.02.2026.
//

struct OAuthTokenResponseBody: Decodable {
        let accessToken: String
        let tokenType: String
        let scope: String
        let createdAt: Int
}

//
//  OAuthTokenResponseBody.swift
//  ImageFeed
//
//  Created by Ильман on 24.02.2026.
//

struct OAuthTokenResponseBody: Decodable {
    let accessToken: String
    let tokenType: String
    let scope: String
    let createdAt: Int
}


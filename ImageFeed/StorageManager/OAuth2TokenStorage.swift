//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Ильман on 24.02.2026.
//

import Foundation

final class OAuth2TokenStorage {
    var token: String? {
        get {
            UserDefaults.standard.string(forKey: "token")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
}

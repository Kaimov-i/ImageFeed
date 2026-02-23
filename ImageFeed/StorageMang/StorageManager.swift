//
//  StorageManager.swift
//  ImageFeed
//
//  Created by Ильман on 22.02.2026.
//

import Foundation

class StorageManager {
    let userDefaults = UserDefaults.standard
    private let tokenKey = "UnsplashOAuthToken"
    
    func save(key: String, value: String) {
        userDefaults.set(value, forKey: key)
    }
    
    var token: String? {
        get {
            userDefaults.string(forKey: tokenKey)
        }
        set {
            userDefaults.set(newValue, forKey: tokenKey)
        }
    }
}

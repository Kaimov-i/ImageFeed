//
//  WebViewViewControllerDelegateProtocol.swift
//  ImageFeed
//
//  Created by Ильман on 15.02.2026.
//

protocol WebViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String)
    func webViewViewControllerDidCancel(_ vc: WebViewViewController)
}

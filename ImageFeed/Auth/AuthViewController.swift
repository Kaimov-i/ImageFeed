//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Ильман on 12.02.2026.
//

import UIKit

protocol AuthViewControllerDelegate: AnyObject {
    func didAuthenticate(_ vc: AuthViewController)
}

final class AuthViewController: UIViewController, WebViewViewControllerDelegate {
    // MARK: - Outlets
    
    @IBOutlet weak var authImageView: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    
    // MARK: - Properties
    
    private let identifireSegue = "ShowWebView"
    weak var delegate: AuthViewControllerDelegate?
    
    // MARK: - Private Properties
    
    private let oauth2Service = OAuth2Service.shared
    private let storageManager = OAuth2TokenStorage()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        configureBackButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifireSegue {
            guard
                let webVC = segue.destination as? WebViewViewController
            else {
                assertionFailure("Failed to prepare for \(identifireSegue)")
                return
            }
            webVC.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    // MARK: - Public Methods
    
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        oauth2Service.fetchToken(code: code) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let tokenResponse):
                storageManager.token = tokenResponse.accessToken
                self.delegate?.didAuthenticate(self)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        //        vc.dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_button")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_button")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.ypBlack
    }
}

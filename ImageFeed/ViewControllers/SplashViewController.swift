//
//  SplashViewController.swift
//  ImageFeed
//
//  Created by Ильман on 24.02.2026.
//

import UIKit

final class SplashViewController: UIViewController {
    // MARK: - Private Properties

    private let storageManager = OAuth2TokenStorage()
    private let showPhotoScreenSegueIdentifier = "showPhotoScreenSegueIdentifier"
    private let showAuthenticationScreenSegueIdentifier = "showAuthenticationScreenSegueIdentifier"

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if storageManager.token != nil {
            performSegue(withIdentifier: showPhotoScreenSegueIdentifier, sender: nil)
        } else {
            performSegue(withIdentifier: showAuthenticationScreenSegueIdentifier, sender: nil)
        }
    }
}

extension SplashViewController: AuthViewControllerDelegate {
    func didAuthenticate(_ vc: AuthViewController) {
        vc.dismiss(animated: true)
        performSegue(withIdentifier: showPhotoScreenSegueIdentifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showAuthenticationScreenSegueIdentifier {
            guard let navigationViewController = segue.destination as? UINavigationController,
                  let viewController = navigationViewController.viewControllers.first as? AuthViewController
            else {
                assertionFailure("Failed to prepare for \(showAuthenticationScreenSegueIdentifier)")
                return
            }
            viewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

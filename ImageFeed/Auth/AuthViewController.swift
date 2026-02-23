//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Ильман on 12.02.2026.
//

import UIKit

class AuthViewController: UIViewController, WebViewViewControllerDelegate {
    
    private func loadToken() {
        
    }
    
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
       
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        vc.dismiss(animated: true)
    }
    
    
    let identifireSegue = "ShowWebView"
    
    @IBOutlet weak var authImageView: UIImageView!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        configureBackButton()
    }
    
    private func configureBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav_back_button")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_button")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.ypBlack
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
    
    
  
}

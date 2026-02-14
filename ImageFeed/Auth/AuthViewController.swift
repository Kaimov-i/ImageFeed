//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Ильман on 12.02.2026.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    
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
        guard let webVC = segue.destination as? WebViewViewController else { return }
        webVC.webView = WKWebView()
    }
   
    
    @IBAction func logInButton(_ sender: UIButton) {
        
    }
    
}

//
//  ProfilViewController.swift
//  ImageFeed
//
//  Created by Ильман on 24.01.2026.
//

import UIKit

class ProfilViewController: UIViewController {
    
    let userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Photo")
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        label.text = "Екатерина Новикова"
        label.textColor = .ypWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.text = "@ekaterina_nov"
        label.textColor = .ypGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.text = "Hello, world!"
        label.textColor = .ypWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let outButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Exit"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    private func setupViews() {
        view.addSubview(userImage)
        view.addSubview(userName)
        view.addSubview(instLabel)
        view.addSubview(userDescription)
        view.addSubview(outButton)
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            userImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            
            instLabel.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8),
            instLabel.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            
            userDescription.topAnchor.constraint(equalTo: instLabel.bottomAnchor, constant: 8),
            userDescription.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            
            outButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            outButton.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
        ])
    }
    
}

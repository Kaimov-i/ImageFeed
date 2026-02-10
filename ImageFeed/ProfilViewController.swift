//
//  ProfilViewController.swift
//  ImageFeed
//
//  Created by Ильман on 24.01.2026.
//

import UIKit

final class ProfilViewController: UIViewController {
    
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
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.text = "Екатерина Новикова"
        label.textColor = .ypWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.text = "@ekaterina_nov"
        label.textColor = .ypGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
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
    
    private lazy var profilStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userName, instLabel, userDescription])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(userImage)
        view.addSubview(profilStackView)
        view.addSubview(outButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            userImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            profilStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profilStackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8),
            
            outButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            outButton.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            outButton.widthAnchor.constraint(equalToConstant: 24),
            outButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}

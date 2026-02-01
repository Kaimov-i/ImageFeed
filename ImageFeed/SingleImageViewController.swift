//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Ilman on 31.01.2026.
//

import UIKit

class SingleImageViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}

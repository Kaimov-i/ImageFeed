//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Ilman on 31.01.2026.
//

import UIKit

class SingleImageViewController: UIViewController {
    
    var image: UIImage? {
        didSet {
            guard isViewLoaded else { return }
            guard let image = image else { return }
            imageView.image = image
        }
    }
    private let minimumZoomScale = 0.1
    private let maximumZoomScale = 1.25
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shareButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        shareButtonOutlet.layer.cornerRadius = shareButtonOutlet.bounds.width / 2
        shareButtonOutlet.clipsToBounds = true
        guard let image = image else { return }
        imageView.image = image
        imageScale(image)
        
        scrollView.delegate = self
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        sender.layer.cornerRadius = sender.bounds.width / 2
    }
    
    private func imageScale(_ image: UIImage) {
        scrollView.minimumZoomScale = minimumZoomScale
        scrollView.maximumZoomScale = maximumZoomScale
        
        view.layoutIfNeeded()
        let hightScale = scrollView.bounds.size.height / image.size.height
        let widthScale = scrollView.bounds.size.width / image.size.width
        
        let theoricalScale = min(hightScale, widthScale)
        let scale = min(maximumZoomScale, max(minimumZoomScale, theoricalScale))
        
        self.scrollView.setZoomScale(scale, animated: true)
        self.scrollView.layoutIfNeeded()
        var center = imageView.frame
    
        if image.size.width < scrollView.bounds.width {
            let originX = (scrollView.bounds.width - image.size.width) / 2.0
            center.origin.x = originX
        } else {
            center.origin.x = 0
        }
        
        if image.size.height < scrollView.bounds.width {
            let originY = (scrollView.bounds.height - image.size.height) / 2
            center.origin.y = originY
        } else {
            center.origin.y = 0
        }
        scrollView.setContentOffset(center.origin, animated: false)
    }
    
    func centerImage() {
        
    }
}
    extension SingleImageViewController: UIScrollViewDelegate {
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            
            imageView
        }
    }


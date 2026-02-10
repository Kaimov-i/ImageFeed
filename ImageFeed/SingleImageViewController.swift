//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Ilman on 31.01.2026.
//

import UIKit

final class SingleImageViewController: UIViewController {
    
    var image: UIImage? {
        didSet {
            guard isViewLoaded else { return }
            guard let image = image else { return }
            imageView.image = image
            imageView.frame.size = image.size
            imageScale(image)
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
        didTapShareButton()
    }
    
    private func didTapShareButton() {
        guard let image = imageView.image else { return }
        let activivtyVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activivtyVC, animated: true)
    }
    private func imageScale(_ image: UIImage) {
        scrollView.minimumZoomScale = minimumZoomScale
        scrollView.maximumZoomScale = maximumZoomScale
        
        view.layoutIfNeeded()
        
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maximumZoomScale, max(minimumZoomScale, min(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        let newContentSize = scrollView.contentSize
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: false)
    }
    
    func centerImage() {
        
    }
}
extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}


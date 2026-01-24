//
//  ViewController.swift
//  ImageFeed
//
//  Created by Ilman on 02.01.2026.
//

import UIKit

final class ImageListViewController: UIViewController {


    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0...20).map { "\($0)"}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .ypBlack
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.contentInset = UIEdgeInsets(top: 13, left: 0, bottom: 12, right: 0)
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()

    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
     
        guard let image = UIImage(named: photosName[indexPath.row]) else { return }
        cell.cellImage.image = image
        cell.cellImage.contentMode = .scaleAspectFill
        cell.dateLabel.text = dateFormatter.string(from: .now)
        
        if indexPath.row % 2 == 0 {
            cell.likeButton.setImage(UIImage(named: "NoActive"), for: .normal)
        } else {
            cell.likeButton.setImage(UIImage(named: "Active"), for: .normal)
        }
    }

}

extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imagesListCell = cell as? ImagesListCell else { return UITableViewCell() }
        
        configCell(for: imagesListCell, with: indexPath)
        return imagesListCell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension ImageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
}

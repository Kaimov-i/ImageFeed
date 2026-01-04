//
//  CostomVievCellTableViewCell.swift
//  ImageFeed
//
//  Created by Ilman on 03.01.2026.
//

import UIKit

class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
}

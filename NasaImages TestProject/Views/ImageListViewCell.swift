//
//  ImageListViewCell.swift
//  NasaImages TestProject
//
//  Created by TL-1 on 06/03/23.
//

import UIKit
import SDWebImage

class ImageListViewCell: UICollectionViewCell {
    
    static let identifier = "ImageListViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    func configCell(_ data : PicturesModel){
        lblTitle.text = data.title
        if let urlString = data.thumbnail, let url = URL(string: urlString) {
            imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "img_placeholder"), options: .progressiveLoad, context: nil)
        }
    }

}

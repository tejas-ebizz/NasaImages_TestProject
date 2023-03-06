//
//  ImageDetailViewCell.swift
//  NasaImages TestProject
//
//  Created by TL-1 on 06/03/23.
//

import UIKit

class ImageDetailViewCell: UICollectionViewCell {
    
    static let identifier = "ImageDetailViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(_ data : PicturesModel){
        lblTitle.text = data.title
        lblDesc.text = data.description
        if let urlString = data.thumbnail, let url = URL(string: urlString) {
            imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "img_placeholder"), options: .progressiveLoad, context: nil)
        }
    }

}

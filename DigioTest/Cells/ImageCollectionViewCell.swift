//
//  ImageCollectionViewCell.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupImage(image: UIImage) {
        self.imageView.image = image
    }
    
}

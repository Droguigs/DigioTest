//
//  CollectionViewCell.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 26/06/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        img.image = UIImage(named: "image_placeholder")
        return img
    }()
    
    var imageURL: String?
    
    func setupView(viewType: CollectionType, imageUrl: String) {
        setImage(imageURL: imageUrl)
        switch viewType {
        case .spotlight:
            imageView.setCornerRadius(radius: 15)
            imageView.setShadowOpacity(opacity: 0.1)
            imageView.setShadowOffset(offset: CGSize(width: 3, height: 3))
            imageView.setShadowColor(color: .black)
            
        case .cash:
            imageView.setCornerRadius(radius: 15)
            imageView.clipsToBounds = true
            
        case .products:
            imageView.setCornerRadius(radius: 15)
            imageView.setShadowOpacity(opacity: 0.1)
            imageView.setShadowOffset(offset: CGSize(width: 1, height: 1))
            imageView.setShadowColor(color: .black)
        }
        imageView.clipsToBounds = false
        
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
        
    }
    
    func setImage(imageURL: String) {
        if self.imageURL != imageURL,
           let url = URL(string: imageURL) {
            self.imageURL = imageURL
            let data = try? Data(contentsOf: url)
            self.imageView.image = UIImage(data: data ?? Data())
        }
    }
}


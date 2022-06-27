//
//  TableViewCell.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 26/06/22.
//

import UIKit

enum CollectionType {
    case spotlight
    case cash
    case products
}

class TableViewCell: UITableViewCell {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.defaultReuseIdentifier)
        collection.allowsMultipleSelection = false
        collection.allowsSelection = true
        return collection
    }()
    
    let icon:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.image = UIImage(named: "person")
        return img
    }()
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setupView(viewType: CollectionType) {
        
        self.contentView.addSubview(icon)
        self.contentView.addSubview(label)
        self.contentView.addSubview(collectionView)
        
        icon.isHidden = true
        
        icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        icon.heightAnchor.constraint(lessThanOrEqualToConstant: 16).isActive = true
        icon.widthAnchor.constraint(lessThanOrEqualToConstant: 16).isActive = true
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 0).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        switch viewType {
        case .spotlight:
            label.text = " Olá, Maria"
            icon.frame.size.height = 16
            icon.frame.size.width = 16
            icon.isHidden = false
            
        case .cash:
            let mutableString = NSMutableAttributedString(string: "digio Cash", attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 18)])
            mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range: NSRange(location:6,length:4))
            label.attributedText = mutableString
            icon.frame.size.height = 0
            icon.frame.size.width = 0
            
        case .products:
            label.text = "Produtos"
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
            icon.frame.size.height = 0
            icon.frame.size.width = 0
        }
    }
}

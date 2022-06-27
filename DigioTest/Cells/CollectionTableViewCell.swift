//
//  CollectionTableViewCell.swift
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

class CollectionTableViewCell: BaseTableViewCell {

    let collectionView: UICollectionView = {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsMultipleSelection = false
        collection.allowsSelection = true
        return collection
    }()
    var didReload: Bool = false
    
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
        
        icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 2).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        switch viewType {
        case .spotlight:
            label.text = "Olá, Maria"
            
        case .cash:
            label.text = "digio Cash"
            
        case .products:
            label.text = "Produtos"
        }
    }
    
    func setupCollection() {
        collectionView.register(ImageCollectionViewCell.self)
        self.didReload = true
    }
    
}

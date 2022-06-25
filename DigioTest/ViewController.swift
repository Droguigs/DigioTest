//
//  ViewController.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let api = SharedAPI()
    var productList: ProductList = ProductList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
        
        setupTableData()
    }
    
    func setupTableData() {
        api.getProducts { [weak self] response in
            switch response {
            case .success(let productList):
                self?.productList = productList ?? ProductList()
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell
        
        cell?.collectionView.delegate = self
        cell?.collectionView.dataSource = self
        cell?.collectionView.tag = indexPath.row
        
        return cell ?? UITableViewCell()
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return productList.spotlights?.count ?? 0
        case 1:
            return productList.cash != nil ? 1 : 0
        case 2:
            return productList.products?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            return UICollectionViewCell()
        case 1:
            return UICollectionViewCell()
        case 2:
            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    
    
}

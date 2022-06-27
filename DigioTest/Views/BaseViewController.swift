//
//  BaseViewController.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 26/06/22.
//

import UIKit

class BaseViewController: UIViewController {

    let tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.nibName)
        table.allowsSelection = false
        table.separatorStyle = .none
        return table
    }()
    
    let api = SharedAPI()
    
    var productList: ProductList = ProductList() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setupView()
        setupTableData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupTableData() {
        tableView.delegate = self
        tableView.dataSource = self
        api.getProducts { [weak self] response in
            switch response {
            case .success(let productList):
                self?.productList = productList ?? ProductList()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 248
        case 1:
            return 162
        default:
            return 152
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.nibName, for: indexPath) as? TableViewCell
        
        cell?.collectionView.delegate = self
        cell?.collectionView.dataSource = self
        cell?.collectionView.tag = indexPath.row
        cell?.collectionView.reloadData()
        
        switch indexPath.row {
        case 0:
            cell?.setupView(viewType: .spotlight)
        case 1:
            cell?.setupView(viewType: .cash)
        case 2:
            cell?.setupView(viewType: .products)
        default:
            return UITableViewCell()
        }
        return cell ?? UITableViewCell()
        
    }
}

extension BaseViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: 335, height: 160)
        case 1:
            return CGSize(width: 335, height: 96)
        case 2:
            return CGSize(width: 60, height: 60)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return productList.spotlights?.count ?? 2
        case 1:
            return 1
        case 2:
            return productList.products?.count ?? 3
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.nibName, for: indexPath) as? CollectionViewCell
        switch collectionView.tag {
        case 0:
            cell?.setupView(viewType: .spotlight, imageUrl: productList.spotlights?[indexPath.row].bannerURL ?? "")
            return cell ?? CollectionViewCell()
        case 1:
            cell?.setupView(viewType: .cash, imageUrl: productList.cash?.bannerURL ?? "")
            return cell ?? CollectionViewCell()
        case 2:
            cell?.setupView(viewType: .products, imageUrl: productList.products?[indexPath.row].imageURL ?? "")
            return cell ?? CollectionViewCell()
        default:
            return cell ?? CollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            presentModalController(name: productList.spotlights?[indexPath.row].name, description: productList.spotlights?[indexPath.row].description)
        case 1:
            presentModalController(name: productList.cash?.title, description: productList.cash?.description)
        case 2:
            presentModalController(name: productList.products?[indexPath.row].name, description: productList.products?[indexPath.row].description)
        default:
            break
        }
    }
}

extension BaseViewController {
    func presentModalController(name: String?, description: String?) {
        let vc = DetailsViewController()
        vc.configureData(name: name, description: description)
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
}

//
//  ViewController.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import UIKit

class MovieListTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChildViewController()
    }
    
    private func configureChildViewController() {
        
        let tableViewNavigationController = UINavigationController(rootViewController: MovieListTableViewController())
        let collectionViewNavigationController = UINavigationController(rootViewController: MovieListCollectionViewController())
        
        tableViewNavigationController.tabBarItem.image = UIImage(named: "ic_table")
        collectionViewNavigationController.tabBarItem.image = UIImage(named: "ic_collection")
        
        tableViewNavigationController.tabBarItem.title = "Table"
        collectionViewNavigationController.tabBarItem.title = "Collection"

        setViewControllers([tableViewNavigationController,collectionViewNavigationController], animated: true)
    }
}


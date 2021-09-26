//
//  ViewController.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import UIKit

class MovieListTabBarController: UITabBarController {
    
    let movieListTableViewController = MovieListTableViewController()
    let movieListCollectionViewController = MovieListCollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChildViewController()
    }
    
    private func configureChildViewController() {
        
        let tableViewNavigationController = UINavigationController(rootViewController: movieListTableViewController)
        let collectionViewNavigationController = UINavigationController(rootViewController: movieListCollectionViewController)
        
        tableViewNavigationController.tabBarItem.image = UIImage(named: "ic_table")
        collectionViewNavigationController.tabBarItem.image = UIImage(named: "ic_collection")
        
        tableViewNavigationController.tabBarItem.title = "Table"
        collectionViewNavigationController.tabBarItem.title = "Collection"
        
        setViewControllers([tableViewNavigationController,collectionViewNavigationController], animated: false)
    }
}


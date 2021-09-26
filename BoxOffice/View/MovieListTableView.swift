//
//  MovieListTableView.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import UIKit

final class MovieListTableView: UIView, RootViewable {
    lazy var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(movieTableView)
    }
    
    func setupUI() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

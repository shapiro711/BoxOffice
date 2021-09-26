//
//  ViewController.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import UIKit

final class MovieListTableViewController: UIViewController, RootViewControllerable {
    
    var moiveList: [MovieThumbnail] = []
    private let movieListTableView = MovieListTableView(frame: .zero)
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        prepareMovieList()
    }
    
    func prepareMovieList() {
        let model: APIable = GetAPI.lookUpMovieList(orderType: 0, contentType: .jsonData)
        networkManager.request(apiModel: model) { [self] (result) in
            print("??")
            switch result {
            case .success(let data):
                guard let parsingData = ParssingManager.decodingModel(data: data, model: MovieList.self) else { return }
                for movie in parsingData.movies {
                    moiveList.append(movie)
                    DispatchQueue.main.async {
                        self.movieListTableView.movieTableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setup() {
        self.view = movieListTableView
        movieListTableView.movieTableView.delegate = self
        movieListTableView.movieTableView.dataSource = self
        
        self.navigationItem.title = "영화 목록"
    }
}

extension MovieListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moiveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else { fatalError() }
        cell.configure(with: moiveList[indexPath.row])
        return cell
    }
}

extension MovieListTableViewController: UITableViewDelegate {
    
}

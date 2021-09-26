//
//  MovieTableViewCell.swift
//  BoxOffice
//
//  Created by Kim Do hyung on 2021/09/25.
//

import UIKit

final class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        setup()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func loadThumbnails(movie: MovieThumbnail, completion: @escaping (UIImage?) -> Void ) {
        
        if let thumbnailURL = URL(string: movie.thumbNail) {
            URLSession.shared.dataTask(with: thumbnailURL) { (data, response, error) in
                if let _ = error {
                    completion( nil )
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                let image = UIImage(data: data)
                completion(image)
                
            }.resume()
        }
    }
    
    func configure(with movie: MovieThumbnail) {
        loadThumbnails(movie: movie) { [self] (image) in
            
            DispatchQueue.main.async {
                postImageView.image = image
            }
        }
        self.titleLabel.text = movie.title
        self.dateLabel.text = movie.date
        self.bodyLabel.text = "기타등등"
    }
}

//MARK: -Layout
extension MovieTableViewCell {
    private func setup() {
        contentView.addSubview(postImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func setupUI() {
        let margin: CGFloat = 10
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin / 2),
            titleLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: margin),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin),
            bodyLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: margin),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
            dateLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: margin),
            dateLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: margin),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

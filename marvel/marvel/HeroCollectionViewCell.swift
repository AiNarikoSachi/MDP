//
//  HeroCollectionViewCell.swift
//  marvel
//
//  Created by шкуренко on 07.11.2021.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
    lazy var heroesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var nameHeroes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 35)
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(heroesImageView)
        contentView.addSubview(nameHeroes)
        
        NSLayoutConstraint.activate([
            heroesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            heroesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            heroesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            heroesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameHeroes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameHeroes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameHeroes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}

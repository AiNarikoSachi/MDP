//
//  ViewController.swift
//  marvel
//
//  Created by шкуренко on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let cellWidth = (3 / 4) * UIScreen.main.bounds.width
    let cellHeight = (4 / 8) * UIScreen.main.bounds.height
    let sectionSpacing = (1 / 8) * UIScreen.main.bounds.width
    let cellSpacing = (1 / 8) * UIScreen.main.bounds.width
    
    let photosName: [UIImage?] = [
        UIImage(named: "Blade"),
        UIImage(named: "Ghost_rider"),
        UIImage(named: "Iron_fist"),
        UIImage(named: "Magneto"),
        UIImage(named: "Punisher")
    ]
    
    let textName: [String] = ["Blade", "Ghost Rider", "Iron Fist", "Magneto", "Punisher"]
    let idCell = "cell"
     
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        
        return label
    }()

    let imageView = UIImageView()
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = cellSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .systemGray2

        collectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: idCell)
        
        collectionView.dataSource = self
         
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyConstraints()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(named: "marvel.png")
        label.text = "Choose your hero"

        view.backgroundColor = .systemGray2
    }
           
    private func applyConstraints() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: cellHeight)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! HeroCollectionViewCell
        
        cell.heroesImageView.image = photosName[indexPath.item]
        cell.nameHeroes.text = textName[indexPath.item]
        
        return cell
    }
}

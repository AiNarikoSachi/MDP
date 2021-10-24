//
//  ViewController.swift
//  heroesMarvel
//
//  Created by Никита Шкуренко on 22.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let pictures = ["Blade","Ghost_rider", "Iron_fist", "Magneto", "Punisher"]
    let name = ["Blade", "Ghost_rider", "Iron_fist", "Magneto", "Punisher"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
            imageView.contentMode = .scaleAspectFit
            let image = UIImage(named: "marvel")
            imageView.image = image
            navigationItem.titleView = imageView
        
        if let layout = collectionView.collectionViewLayout as? PagingCollectionViewLayout {
            layout.itemSize = .init(width: view.frame.width - 40, height: 500)
            layout.minimumLineSpacing = 20
            layout.sectionInset = .init(top:20, left: 20, bottom:20, right:20)
            layout.scrollDirection = .horizontal
        }
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "heroesCell", for: indexPath) as! HeroesCollectionViewCell
        
        let  imageName = pictures[indexPath.item]
        let image = UIImage(named: imageName)
        cell.heroesImageView.image = image
        
        cell.heroesLabelView.text = name[indexPath.row]
        
        return cell
    }
    
    
}

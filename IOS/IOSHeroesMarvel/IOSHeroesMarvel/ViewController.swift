//
//  ViewController.swift
//  IOSHeroesMarvel
//
//  Created by шкуренко on 06.11.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photo = ["Blade","Ghost_rider", "Iron_fist", "Magneto", "Punisher"]
    let name = ["Blade", "Ghost_rider", "Iron_fist", "Magneto", "Punisher"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let imageName = "marvel.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 50, y: 25, width: 300, height: 100)
        view.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
            label.center = CGPoint(x: 190, y: 285)
            label.textAlignment = .center
            label.text = "Choose your hero"
            label.textColor = .white
            label.font = label.font.withSize(30)

            self.view.addSubview(label)
        
        if let layout = collectionView.collectionViewLayout as? PagingCollectionViewLayout {
            layout.itemSize = .init(width: view.frame.width - 90, height: 500)
            layout.minimumLineSpacing = 20
            layout.sectionInset = .init(top:20, left: 20, bottom:20, right:20)
            layout.scrollDirection = .horizontal
        }
        view.backgroundColor = .systemGray2
        collectionView.backgroundColor = .systemGray2
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marvelCell", for: indexPath) as! CollectionViewCell
        
        let  imageName = photo[indexPath.item]
        let image = UIImage(named: imageName)
        cell.HeroesImageView.image = image
        
        cell.HeroesLabeView.text = name[indexPath.row]
        
        return cell
    }
    
    
}


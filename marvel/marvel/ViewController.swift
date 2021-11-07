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
     
     let photosName: [UIImage] = [
        UIImage(named:"Blade")!,
        UIImage(named: "Ghost_rider")!,
        UIImage(named: "Iron_fist")!,
        UIImage(named: "Magneto")!,
        UIImage(named:"Punisher")!
     ]
    
     let textName: [String] = ["Blade", "Ghost_rider", "Iron_fist", "Magneto", "Punisher"]
     let idCell = "cell"
     
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
         collectionView.dataSource = self
         collectionView.backgroundColor = nil
         return collectionView
     }()
    
    class collectionViewCell: UICollectionViewCell {
        let heroesImageView = UIImageView()
        let nameHeroes = UILabel (frame: CGRect(x: -60, y: (4 / 8) * UIScreen.main.bounds.height - 60, width: (3 / 4) * UIScreen.main.bounds.width, height: 40 ))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
               registerCollectionViewCells()
               applyConstraints()
        
        let imageName = "marvel.png"
                let image = UIImage(named: imageName)
                let imageView = UIImageView(image: image!)
                imageView.frame = CGRect(x: 100, y: 30, width: 200, height: 50)
                view.addSubview(imageView)

                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
                    label.center = CGPoint(x: 190, y: 185)
                    label.textAlignment = .center
                    label.text = "Choose your hero"
                    label.textColor = .white
                    label.font = label.font.withSize(30)

                    self.view.addSubview(label)
        
                view.backgroundColor = .systemGray2
                collectionView.backgroundColor = .systemGray2
    }
    
           private func registerCollectionViewCells() {
               collectionView.register(collectionViewCell.self, forCellWithReuseIdentifier: idCell)
           }
           
           private func applyConstraints() {
               view.addSubview(collectionView)
               collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
               collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
               collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
           }
       }

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! collectionViewCell
        
        let  imageName = photosName[indexPath.item]
        cell.heroesImageView.image = imageName
        cell.heroesImageView.contentMode = .scaleAspectFill
        
        let lablName = textName[indexPath.item]
        cell.nameHeroes.text = lablName
        cell.nameHeroes.textColor = .white
        cell.nameHeroes.font = cell.nameHeroes.font.withSize(35)
        cell.nameHeroes.textAlignment = .center
        
        cell.backgroundView = cell.heroesImageView
        cell.addSubview(cell.nameHeroes)
        return cell
    }
    
    
}



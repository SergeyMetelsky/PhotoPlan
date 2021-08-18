//
//  ViewController.swift
//  PhotoPlan
//
//  Created by Sergey on 8/16/21.
//

import UIKit

class LocationsViewController: UIViewController {
        
    var locationCatalog: [Location] =  {
        var locationCatalog: [Location] = []
        let location1 = Location(name: "1", photo: true)
        let location2 = Location(name: "2", photo: false)
        let location3 = Location(name: "3", photo: true)
        locationCatalog = [location1, location2, location3]
        return locationCatalog
    }()
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 303")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ЛОКАЦИИ"
        label.textAlignment = .center
        if let font = UIFont(name: "Oswald", size: 25) {
            label.font = font
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Group 159"), for: .normal)
        button.setShadowAndRadius()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
       
        view.addSubview(titleImageView)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        view.addSubview(plusButton)
        
        setupTitleImageView()
        setupTitleLabel()
        setupCollectionView()
        setupPlusButton()
        
        collectionView.register(LocationCell.self, forCellWithReuseIdentifier: "LocationCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupTitleImageView() {
        let guide = view.safeAreaLayoutGuide
        titleImageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 44.5).isActive = true
//        titleImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        titleImageView.heightAnchor.constraint(equalToConstant: 42.5).isActive = true
        titleImageView.widthAnchor.constraint(equalToConstant: 232.5).isActive = true
        titleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupTitleLabel() {
        let guide = view.safeAreaLayoutGuide
        titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 44.5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 42.5).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 232.5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        let guide = view.safeAreaLayoutGuide
        collectionView.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    private func setupPlusButton() {
        plusButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        plusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height / 3)).isActive = true
    }
}


extension LocationsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // количество ячеек задаем
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationCatalog.count
    }
    
    // внешний вид и содержание задаем
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! LocationCell
        let location = self.locationCatalog[indexPath.item]
        cell.setupCell(location: location)
        return cell
    }
    
    //  размер ячейки задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let location = self.locationCatalog[indexPath.item]
        let screenWidth = UIScreen.main.bounds.size.width

        // параметры collectionView входячего в эту ячейку
        let offset: CGFloat = 30
        let spacing: CGFloat = 10
        let numberOfColumns: CGFloat = 3
        let numberOfRows: CGFloat = 2
        let cellWidth = (screenWidth - (offset * 2) - (2 * spacing)) / numberOfColumns
        let collectionViewBottomOffset: CGFloat = 17
        let collectionViewHeight = cellWidth * numberOfRows + spacing
        
        let cellSize: CGSize = location.photo ? CGSize(width: screenWidth, height: 95 + collectionViewHeight + collectionViewBottomOffset) : CGSize(width: screenWidth, height: 95)
        //        let cellWidth = screenWidth - offset * 2
        //        return CGSize(width: screenWidth, height: 75) // размер под название локации
        //        return CGSize(width: screenWidth, height: 95) // размер под ячейку с тенями
        return cellSize
    }
    
    // отспут между ячейками задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
}


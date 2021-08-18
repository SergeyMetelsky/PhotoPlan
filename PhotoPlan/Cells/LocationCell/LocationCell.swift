//
//  LocationCell.swift
//  PhotoPlan
//
//  Created by Sergey on 8/16/21.
//

import UIKit

class LocationCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(backView)
//        addSubview(backView)
        backView.addSubview(frontView)
        frontView.addSubview(textField)
        frontView.addSubview(plusButton)
        frontView.addSubview(collectionView)

        setupBackView()
        setupFrontView()
        setupTextField()
        setupPlusButton()
        setupCollectionView()
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.dataSource = self
        collectionView.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var photoCatalog: [UIImage] = {
        var photoCatalog: [UIImage] = []
        let photo1 = UIImage(named: "studio1")
        let photo2 = UIImage(named: "studio2")
        let photo3 = UIImage(named: "studio3")
        let photo4 = UIImage(named: "studio4")
        let photo5 = UIImage(named: "studio5")
        let photo6 = UIImage(named: "studio6")
        
        photoCatalog = [photo1!, photo2!, photo3!, photo4!, photo5!, photo6!]
        return photoCatalog
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setupShadowAndRadius()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let frontView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 237/255, green: 243/255, blue: 244/255, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название локации"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Group 159"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    private func setupBackView() {
        backView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupFrontView() {
        frontView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15).isActive = true
        frontView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15).isActive = true
        frontView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15).isActive = true
        frontView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -15).isActive = true
    }
    
    private func setupTextField() {
        textField.leftAnchor.constraint(equalTo: frontView.leftAnchor, constant: 15).isActive = true
        textField.rightAnchor.constraint(equalTo: plusButton.leftAnchor, constant: -15).isActive = true
        textField.topAnchor.constraint(equalTo: frontView.topAnchor, constant: 10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        textField.bottomAnchor.constraint(equalTo: frontView.bottomAnchor, constant: -15).isActive = true
    }
    
    private func setupPlusButton() {
        plusButton.rightAnchor.constraint(equalTo: frontView.rightAnchor, constant: -10).isActive = true
        plusButton.topAnchor.constraint(equalTo: frontView.topAnchor, constant: 10).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func setupCollectionView() {
        collectionView.topAnchor.constraint(equalTo: frontView.topAnchor, constant: 45).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: frontView.bottomAnchor, constant: -17).isActive = true
        collectionView.leftAnchor.constraint(equalTo: frontView.leftAnchor, constant: 15).isActive = true
        collectionView.rightAnchor.constraint(equalTo: frontView.rightAnchor, constant: -15).isActive = true
    }
    
    func setupCell(location: Location) {
        self.textField.text = location.name
    }
}

extension LocationCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // количество ячеек задаем
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    // внешний вид и содержание задаем
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photo = self.photoCatalog[indexPath.item]
        cell.backgroundColor = .black
        cell.setupCell(photo: photo)
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        return cell
    }
    
    //  размер ячейки задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 10
        let numberOfColumns: CGFloat = 3
        let cellWidth = (collectionView.layer.frame.width - (2 * spacing)) / numberOfColumns
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    // отспут между ячейками задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

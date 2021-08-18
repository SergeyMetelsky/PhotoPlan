//
//  PhotoCell.swift
//  PhotoPlan
//
//  Created by Sergey on 8/17/21.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(selectButton)
        
        setupImageView()
        setupSelectButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SelectPlus"), for: .normal)
        button.isHidden = true
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupImageView() {
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupSelectButton() {
        selectButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        selectButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        selectButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        selectButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupCell(photo: UIImage) {
        self.imageView.image = photo
    }
}

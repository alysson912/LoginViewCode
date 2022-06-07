//
//  SportCollectionViewCell.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 01/06/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
 
    static let identifier: String = "SportCollectionVIewCell"
    
    let SportCollectionViewCellScreen : SportCollectionVIewCellScreen = SportCollectionVIewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstraints()
    }
    
    public func  setupCell(data: Sport){
        self.SportCollectionViewCellScreen.imageView.image = UIImage(named: data.nameImage)
        self.SportCollectionViewCellScreen.sportName.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func addSubview() {
         self.SportCollectionViewCellScreen.layer.borderWidth = 6.0
         self.SportCollectionViewCellScreen.layer.borderColor = UIColor.blue.cgColor
        self.SportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(SportCollectionViewCellScreen)
    }
 
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.SportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.SportCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.SportCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.SportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

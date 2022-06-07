//
//  SportTableViewCellScreen.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 01/06/22.
//

import UIKit

class SportTableViewCellScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .none
        collectionView.delaysContentTouches = false
        collectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstraintsCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func
    configProtocolsCollectionView( delegate : UICollectionViewDelegate, dataSource : UICollectionViewDataSource){
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
     func addSubview() {
         self.addSubview(collectionView)
         
    }
    
//    func configConstraints(){
//        NSLayoutConstraint.activate([
//            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
//            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
//            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//    }
    func configConstraintsCollectionView(){
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

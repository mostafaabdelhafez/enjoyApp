//
//  videosHeaderForSlider.swift
//  enjoyApp
//
//  Created by Mostafa on 15/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class videosHeaderForSlider: UITableViewHeaderFooterView {
    
    let sliderCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        return cv
    }()
    func setupConstraints(){
        self.addSubview(sliderCollectionView)
        sliderCollectionView.Anchor(Top: self.topAnchor, Left: self.leftAnchor, Bottom: self.bottomAnchor, Right: self.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupConstraints()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.backgroundColor = .clear
        sliderCollectionView.register(sliderCell.self, forCellWithReuseIdentifier: "sliderCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension videosHeaderForSlider:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! sliderCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sliderCollectionView.frame.width * 0.8, height: sliderCollectionView.frame.height)
    }
    
    
    
}

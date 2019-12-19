//
//  sliderCell.swift
//  enjoyApp
//
//  Created by Mostafa on 15/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class sliderCell: UICollectionViewCell {
    let background:UIView = {
        let v = UIView()
        v.clipsToBounds = true
        v.layer.cornerRadius = 15
        v.backgroundColor = .black
        return v
    }()
    
    let playIcon:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "Group 432")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(background)
        backgroundColor = .clear
        background.Anchor(Top: topAnchor, Left: leftAnchor, Bottom: bottomAnchor, Right: rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        background.addSubview(playIcon)
        playIcon.Anchor(Top: nil, Left: nil, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 40, Height: 40)
        playIcon.centerXAnchor.constraint(equalTo: background.centerXAnchor, constant: 0).isActive = true
        playIcon.centerYAnchor.constraint(equalTo: background.centerYAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

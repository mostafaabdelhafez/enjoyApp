//
//  userInfoHeader.swift
//  enjoyApp
//
//  Created by Mostafa on 16/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class userInfoHeader: UITableViewHeaderFooterView {
    let backgrounFrame:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.image = #imageLiteral(resourceName: "Ellipse 21")
        return image
    }()
    let userName:UILabel = {
        let label = UILabel()
        label.text = "Heba Rashad"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)

        return label
    }()
    let Email:UILabel = {
        let label = UILabel()
        label.text = "HebaRashad@gmail.com"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 8)
        return label
    }()

    
    
    let userImg:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    func setupConstraints(){
        
        self.addSubview(backgrounFrame)
        backgrounFrame.Anchor(Top: topAnchor, Left: leftAnchor, Bottom: nil, Right: nil, TopPadding: 12, LeftPadding: 20, BottomPadding: 0, RightPadding: 0, Width: 75, Height: 75)
        backgrounFrame.addSubview(userImg)
        userImg.Anchor(Top: backgrounFrame.topAnchor, Left: backgrounFrame.leftAnchor, Bottom: nil, Right: nil, TopPadding: 12, LeftPadding: 12, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        let Infostack = UIStackView(arrangedSubviews: [userName,Email])
        Infostack.axis = .vertical
        Infostack.spacing = 4
        addSubview(Infostack)
        
        Infostack.Anchor(Top: nil, Left: leftAnchor, Bottom: bottomAnchor, Right: rightAnchor, TopPadding: 0, LeftPadding: 20, BottomPadding: -12, RightPadding: -12, Width: 0, Height: 0)

    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgrounFrame.layer.cornerRadius = 75 / 2
        setupConstraints()
//        backgroundColor = .red
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

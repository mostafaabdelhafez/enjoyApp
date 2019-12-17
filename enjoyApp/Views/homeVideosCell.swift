//
//  homeVideosCell.swift
//  enjoyApp
//
//  Created by Mostafa on 17/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class homeVideosCell: UITableViewCell {
    let videoContainer:UIView = {
        let v = UIView()
        return v
    }()
    let settingButton:UIButton = {
        let button = UIButton(type: .system)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(#imageLiteral(resourceName: "Group 344").withRenderingMode(.alwaysOriginal), for: [])
        return button
    }()
    let thumbnail:UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        return image
    }()
    let titleContrainer:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "Rectangle 1418")
        return image
    }()
    let Title:UILabel = {
        let label = UILabel()
        label.text = "Heba Rashad"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 8)
        label.textAlignment = .center
        return label
    }()
    let eyeLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "eye"
        label.font = UIFont.boldSystemFont(ofSize: 8)

        return label
    }()
    let thumbsUpLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "thumbs-up"
        label.font = UIFont.boldSystemFont(ofSize: 8)

        return label
    }()
    let numberOfviews:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "2"
        label.font = UIFont.boldSystemFont(ofSize: 8)

        return label
    }()
    let numberofthumbsUp:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "2"
        label.font = UIFont.boldSystemFont(ofSize: 8)

        return label
    }()


    let thumbsUpButton : UIButton = {
        let button = UIButton(type: .system)
//        button.setImage(#imageLiteral(resourceName: "thumbs-up").withRenderingMode(.alwaysOriginal), for:[])
        button.imageView?.contentMode = .scaleAspectFit  
        return button
    }()
        let playIcon:UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit

            image.image = #imageLiteral(resourceName: "Group 446")
            return image
        }()

    let artistImg:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        
//        image.backgroundColor = .black
        return image
    }()
    let userName:UILabel = {
        let label = UILabel()
        label.text = "Heba Rashad"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)

        return label
    }()
    let Email:UILabel = {
        let label = UILabel()
        label.text = "HebaRashad@gmail.com"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 8)
        return label
    }()

    
    func setupConstraints(){
        
        artistImg.layer.cornerRadius = 19

        self.addSubview(videoContainer)
        videoContainer.Anchor(Top: self.topAnchor, Left: self.leftAnchor, Bottom: nil, Right: self.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 180)
        videoContainer.addSubview(thumbnail)
        thumbnail.Anchor(Top: videoContainer.topAnchor, Left: videoContainer.leftAnchor, Bottom: videoContainer.bottomAnchor, Right: videoContainer.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        thumbnail.addSubview(playIcon)
        playIcon.Anchor(Top: nil, Left: nil, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 40, Height: 40)
        playIcon.centerXAnchor.constraint(equalTo: thumbnail.centerXAnchor, constant: 0).isActive = true
        playIcon.centerYAnchor.constraint(equalTo: thumbnail.centerYAnchor, constant: 0).isActive = true

        thumbnail.addSubview(titleContrainer)
        titleContrainer.Anchor(Top: thumbnail.topAnchor, Left: thumbnail.leftAnchor, Bottom: nil, Right: nil, TopPadding: 12, LeftPadding: 12, BottomPadding: 0, RightPadding: 0, Width: 80, Height: 35)
        titleContrainer.addSubview(Title)
        Title.Anchor(Top: titleContrainer.topAnchor, Left: titleContrainer.leftAnchor, Bottom: titleContrainer.bottomAnchor, Right: titleContrainer.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        self.addSubview(artistImg)
        artistImg.Anchor(Top: videoContainer.bottomAnchor, Left: self.leftAnchor, Bottom: nil, Right: nil, TopPadding: 5, LeftPadding: 8, BottomPadding: 0, RightPadding: 0, Width: 40, Height: 40)
        
        let nameAndEmailstack = UIStackView(arrangedSubviews: [userName,Email])
        nameAndEmailstack.axis = .vertical
        nameAndEmailstack.spacing = 0
        nameAndEmailstack.distribution = .fill
        self.addSubview(nameAndEmailstack)
        nameAndEmailstack.Anchor(Top: nil, Left: artistImg.rightAnchor, Bottom: nil, Right: nil, TopPadding: 0, LeftPadding: 4, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        nameAndEmailstack.centerYAnchor.constraint(equalTo: artistImg.centerYAnchor, constant: 0).isActive = true

        self.addSubview(thumbsUpButton)
        self.addSubview(settingButton)
        settingButton.Anchor(Top: nil, Left: nil, Bottom: nil, Right: self.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: -8, Width: 20, Height: 20)
        settingButton.centerYAnchor.constraint(equalTo: artistImg.centerYAnchor, constant: 0).isActive = true

        thumbsUpButton.Anchor(Top: nil, Left: nil, Bottom: nil, Right: settingButton.leftAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: -5, Width: 60, Height: 20)
        thumbsUpButton.centerYAnchor.constraint(equalTo: artistImg.centerYAnchor, constant: 0).isActive = true
        let eyeStack = UIStackView(arrangedSubviews: [eyeLabel,numberOfviews])
        eyeStack.axis = .horizontal
        eyeStack.spacing = 2
        let thumbsStack = UIStackView(arrangedSubviews: [thumbsUpLabel,numberofthumbsUp])
        thumbsStack.axis = .horizontal
        thumbsStack.spacing = 2
       let containerStack = UIStackView(arrangedSubviews: [thumbsStack,eyeStack])
        containerStack.axis = .horizontal
        containerStack.spacing = 8

        self.thumbnail.addSubview(containerStack)
        
        containerStack.Anchor(Top: nil, Left: thumbnail.leftAnchor, Bottom: thumbnail.bottomAnchor, Right: nil, TopPadding: 0, LeftPadding: 12, BottomPadding: -8, RightPadding: 0, Width: 0, Height: 0)
        
    }
    @objc func handleThumsUp(){
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

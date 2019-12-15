//
//  videosCell.swift
//  enjoyApp
//
//  Created by Mostafa on 15/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class videosCell: UITableViewCell {
    
    let background:UIView = {
        let v = UIView()
        v.clipsToBounds = true
        v.layer.cornerRadius = 8
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        background.backgroundColor = .gray
        self.addSubview(background)
        background.Anchor(Top: topAnchor, Left: leftAnchor, Bottom: bottomAnchor, Right: rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)

        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(background)
        background.Anchor(Top: topAnchor, Left: leftAnchor, Bottom: bottomAnchor, Right: rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  sideMenuCell.swift
//  enjoyApp
//
//  Created by Mostafa on 16/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class sideMenuCell: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

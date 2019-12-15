//
//  Extensions.swift
//  enjoyApp
//
//  Created by Mostafa on 14/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    
    func Anchor(Top:NSLayoutYAxisAnchor?,Left:NSLayoutXAxisAnchor?,Bottom:NSLayoutYAxisAnchor?,Right:NSLayoutXAxisAnchor?,TopPadding:CGFloat,LeftPadding:CGFloat,BottomPadding:CGFloat,RightPadding:CGFloat,Width:CGFloat,Height:CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let Top = Top{
            self.topAnchor.constraint(equalTo: Top, constant: TopPadding).isActive = true
            
        }
        if let Left = Left{
            self.leftAnchor.constraint(equalTo: Left, constant: LeftPadding).isActive = true}
        if let Bottom = Bottom{
            self.bottomAnchor.constraint(equalTo: Bottom, constant: BottomPadding).isActive = true}
        if let Right = Right{
            self.rightAnchor.constraint(equalTo: Right, constant: RightPadding).isActive = true}
        if Width != 0{
            self.widthAnchor.constraint(equalToConstant: Width).isActive = true
        }
        if Height != 0{
            self.heightAnchor.constraint(equalToConstant: Height).isActive = true
        }
        
    }
    
    
}


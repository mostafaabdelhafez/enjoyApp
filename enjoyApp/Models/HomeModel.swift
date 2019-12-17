//
//  HomeModel.swift
//  enjoyApp
//
//  Created by Mostafa on 17/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
import UIKit
class Video{
    var id:Int
    var video:String
    var thumb_nail:String
    var likes:Int
    var views:Int
    var title:String
    var liked:Bool
    var category:category
    var artist:artist
    init(id:Int,video:String,thumb_nail:String,likes:Int,views:Int,title:String,liked:Bool,category:category,artist:artist) {
        self.id = id
        self.video = video
        self.thumb_nail = thumb_nail
        self.likes = likes
        self.views = views
        self.title = title
        self.liked = liked
        self.category = category
        self.artist = artist
    }
}
class category{
    var id:Int
    var name:String
    init(id:Int,name:String) {
        self.id = id
        self.name = name
    }
}
class artist{
    
    var id:Int
    var image:String
    var price:Int
    var name:String
    init(id:Int,image:String,price:Int,name:String) {
        self.id = id
        self.image = image
        self.price = price
        self.name = name
    }
}
struct thumbsUp {
    var row:Int
    var isLiked = false
}
class videoViewsandThumbs {
    var views : Int
    var thumb :Int
    init(views:Int,thumb:Int) {
        self.views = views
        self.thumb = thumb
    }
}

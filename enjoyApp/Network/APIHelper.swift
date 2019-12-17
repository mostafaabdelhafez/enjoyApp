//
//  APIHelper.swift
//  enjoyApp
//
//  Created by Mostafa on 16/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
class APIHelper{
    
    public static let instance = APIHelper()
    public static let BASE_URL = "http://emenjoy.com/Enjoy/public/api/public/"
    
    public class APICore{
        static func loadHome(completion:@escaping(_ videos:[Video]?,_ code:Int?,_ AD:String?,_ sliderData:[String]?)->Void){
            
            let url = APIHelper.BASE_URL + "home"
            print(url)
            
            let header = ["Accept-Language":"en"]
            
            Alamofire.request(url, method: .get,encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
                var arrayOfVideos = [Video]()
                var adIMG = ""
                var videosInSlider = [String]()
                switch response.result{
                case .success:
                    print(response.result.value!)
                    
                    if let json = JSON(rawValue: response.result.value!){
                        print(json)
                        let code = json["status_code"].int ?? 0
                        guard let Data = json["data"].dictionary else{return completion(nil,nil,nil,nil)}
                                        
                        if let slider = Data["slider"]?.array {
                            for oneVideo in slider{
                                
                            videosInSlider.append(oneVideo["video"].string ?? "")

                            }
                        }

                        guard let videosDict = Data["videos"]?.dictionary else {
                            return completion(nil,nil,nil,videosInSlider)
                        }
                        adIMG = videosDict["ad"]?["image"].string ?? ""
                        guard let videos = videosDict["videos"]?.array else{return completion(nil,nil,nil,videosInSlider)}
                        
                        
                        for singleVideo in videos{
                            arrayOfVideos.append(Video(id: singleVideo["id"].int ?? 0, video: singleVideo["video"].string ?? "", thumb_nail: singleVideo["thumb_nail"].string ?? "", likes: singleVideo["likes"].int ?? 0, views: singleVideo["views"].int ?? 0, title: singleVideo["title"].string ?? "", liked: singleVideo["liked"].bool ?? false, category:category.init(id: singleVideo["category"]["id"].int ?? 0, name: singleVideo["category"]["name"].string ?? ""), artist: artist.init(id: singleVideo["artist"]["id"].int ?? 0, image: singleVideo["artist"]["image"].string ?? "", price: singleVideo["artist"]["price"].int ?? 0, name: singleVideo["artist"]["name"].string ?? "")))
                        }
//                        guard let AD = Data["ad"]?.dictionary else {
//
//                            return completion(arrayOfVideos,code,"")
//                        }
//                        let adImg = AD["image"]?.string ?? ""
                        completion(arrayOfVideos,code,adIMG,videosInSlider)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(nil,nil,nil,nil)
                    
                }
            }
            
        }
    }
}

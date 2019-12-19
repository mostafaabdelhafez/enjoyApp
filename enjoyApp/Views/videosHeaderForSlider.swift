//
//  videosHeaderForSlider.swift
//  enjoyApp
//
//  Created by Mostafa on 15/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class videosHeaderForSlider: UITableViewHeaderFooterView {
    var Currentindex = 0
    var arrayOfVideos = [String]()
    weak var parentVC : Home?
    let sliderCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        return cv
    }()
    let PageController:UIPageControl = {
        let controller = UIPageControl()
        controller.currentPageIndicatorTintColor = .purple
        controller.pageIndicatorTintColor = .lightGray
        controller.hidesForSinglePage = true
        controller.contentHorizontalAlignment = .left
        return controller
    }()

    
    func setupConstraints(){
        self.addSubview(sliderCollectionView)
        sliderCollectionView.Anchor(Top: self.topAnchor, Left: self.leftAnchor, Bottom: self.bottomAnchor, Right: self.rightAnchor, TopPadding: 0, LeftPadding: 4, BottomPadding: -50, RightPadding: -4, Width: 0, Height: 0)
        self.addSubview(PageController)
        PageController.Anchor(Top: sliderCollectionView.bottomAnchor, Left: self.leftAnchor, Bottom: nil, Right: self.rightAnchor, TopPadding: 8, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
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
        return arrayOfVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! sliderCell
        if let url = URL(string: "\(arrayOfVideos[indexPath.item])"){
            let player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = CGRect(x: 0, y: 0, width:collectionView.frame.width, height: 200)
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//            cell.background.layer.addSublayer(playerLayer)
//            player.pause()
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sliderCollectionView.frame.width * 0.8, height: sliderCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let url = URL(string:arrayOfVideos[indexPath.item]){
                let player = AVPlayer(url: url)
                let controller = AVPlayerViewController()
                controller.player = player
                if let parent = parentVC{
                    parent.present(controller, animated: true) {
                        player.play()
                    }
                }
           }
      }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        Currentindex = Int(scrollView.contentOffset.x) / Int(sliderCollectionView.frame.width * 0.7)
         print(Currentindex)
        
         PageController.currentPage = Currentindex

    }
    
    
}

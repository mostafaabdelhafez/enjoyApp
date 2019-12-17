//
//  Home.swift
//  enjoyApp
//
//  Created by Mostafa on 14/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
import SideMenu
import AVFoundation
import Kingfisher
import AVKit
class Home: UIViewController {
    var arrayofThumbsAndViews = [videoViewsandThumbs]()
    var arrayOfVideos = [Video]()
    var sliderData = [String]()
    var arrayOfThumbsUp = [thumbsUp]()
    let badgeLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: -5, width: 18, height: 18))
        label.layer.borderColor = UIColor.clear.cgColor
        label.font = UIFont.boldSystemFont(ofSize: 9)
        label.textColor = .white
        label.backgroundColor = .red
        label.clipsToBounds = true
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    let backgroundImg:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "Mask Group 6")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let sideMenuButton:UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleSideMenuButton), for: .touchUpInside)
//        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.setImage(#imageLiteral(resourceName: "icons-menu").withRenderingMode(.alwaysOriginal), for: [])
        
        return button
    }()
    @objc func handleSideMenuButton(){
        print("present sideMenu")
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    func setupSideMenu(){
        let menuRightNavigationController = storyboard?.instantiateViewController(withIdentifier: "sideMenuController") as! SideMenuNavigationController
        SideMenuManager.default.leftMenuNavigationController = menuRightNavigationController
        SideMenuManager.default.menuFadeStatusBar = true
        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.leftMenuNavigationController?.isNavigationBarHidden = true
    }
    let notificationButton:UIButton = {
        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.setImage(#imageLiteral(resourceName: "notifications").withRenderingMode(.alwaysOriginal), for: [])
        button.addTarget(self, action: #selector(handleNotificationButton), for: .touchUpInside)

        return button
    }()
    @objc func handleNotificationButton(){
        
        if let notificationVC = storyboard?.instantiateViewController(identifier: "Notifications") as? Notifications{
            self.navigationController?.pushViewController(notificationVC, animated: true)
        }
    }
    
    let HomeTitle:UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let videosTableView:UITableView = {
        let tv = UITableView(frame: .zero, style:.grouped)
        return tv
    }()

    func setupConstraints(){
        view.addSubview(backgroundImg)
        backgroundImg.Anchor(Top:view.topAnchor, Left: view.leftAnchor, Bottom: nil, Right: view.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 200)
        backgroundImg.addSubview(sideMenuButton)
        backgroundImg.addSubview(HomeTitle)
        backgroundImg.addSubview(notificationButton)
        sideMenuButton.Anchor(Top: backgroundImg.topAnchor, Left: backgroundImg.leftAnchor, Bottom: nil, Right: nil, TopPadding: 40, LeftPadding: 12, BottomPadding: 0, RightPadding: 0, Width: 30, Height: 30)
        notificationButton.Anchor(Top: backgroundImg.topAnchor, Left: nil, Bottom: nil, Right: backgroundImg.rightAnchor, TopPadding: 40, LeftPadding: 0, BottomPadding: 0, RightPadding: -12, Width: 25, Height: 25)
        HomeTitle.Anchor(Top: backgroundImg.topAnchor, Left: nil, Bottom: nil, Right: nil, TopPadding: 40, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        HomeTitle.centerXAnchor.constraint(equalTo: backgroundImg.centerXAnchor, constant: 0).isActive = true
        view.addSubview(videosTableView)
        videosTableView.Anchor(Top: HomeTitle.bottomAnchor, Left: backgroundImg.leftAnchor, Bottom: view.bottomAnchor, Right: backgroundImg.rightAnchor, TopPadding: 25, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 0)
        badgeLabel.layer.borderWidth = 2
        badgeLabel.layer.cornerRadius = badgeLabel.bounds.size.height / 2
        notificationButton.addSubview(badgeLabel)
//        videosTableView.addSubview(footerImg)
//        footerImg.Anchor(Top: nil, Left: view.leftAnchor, Bottom: videosTableView.bottomAnchor, Right: view.rightAnchor, TopPadding: 0, LeftPadding: 0, BottomPadding: 0, RightPadding: 0, Width: 0, Height: 100)
        
    }
    let footerImg : UIImageView = {
        let image = UIImageView()
//        image.backgroundColor = .red
        return image
    }()
    func loadData(){
        APIHelper.APICore.loadHome { (videos, code,adIMG,slider) in
            if videos != nil {
                
                if slider != nil {
                    print(slider!.count)
                    
                    self.sliderData = slider!
                }
                if code == 200{
                    for i in 0..<videos!.count{
                        self.arrayOfThumbsUp.append(thumbsUp(row:i, isLiked: videos![i].liked))
                    }
                    if adIMG != nil , adIMG != "" {
                        
//                        self.footerImg.isHidden = true
                        
                        let encodedImg = adIMG!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                        if let url = URL(string: encodedImg!){
                            self.footerImg.kf.indicatorType = .activity
                            self.footerImg.kf.setImage(with: url)
                            
                        }
                    }
                    else{
                        self.footerImg.heightAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                    self.arrayOfVideos = videos!
                    print(videos![0].artist.image)
                    self.videosTableView.reloadData()

                }
            }
        }
        
    }
    func setUpVideosTableView(){
        videosTableView.delegate = self
        videosTableView.dataSource = self
        videosTableView.isScrollEnabled = true
        videosTableView.backgroundColor = .clear
        videosTableView.tableFooterView = UIView()
        videosTableView.separatorStyle = .none
        videosTableView.register(videosHeaderForSlider.self, forHeaderFooterViewReuseIdentifier: "videosHeaderForSlider")
        videosTableView.register(homeVideosCell.self, forCellReuseIdentifier: "homeVideosCell")
        videosTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "f")

        
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupSideMenu()
        loadData()
        setUpVideosTableView()
        view.backgroundColor = .white
        setupConstraints()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Home:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeVideosCell", for: indexPath) as! homeVideosCell
        
        //            cell.background.layer.addSublayer(playerLayer)
        //            player.pause()

        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        let encodedThumbnail = arrayOfVideos[indexPath.row].thumb_nail.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let url = URL(string: encodedThumbnail ?? ""){
            
            cell.thumbnail.kf.setImage(with: url)
            cell.thumbnail.kf.indicatorType = .activity
        }
        cell.Title.text = arrayOfVideos[indexPath.row].title
        cell.Email.text = arrayOfVideos[indexPath.row].artist.name
        cell.userName.text = arrayOfVideos[indexPath.row].category.name
        let encodedString = arrayOfVideos[indexPath.row].artist.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let url = URL(string:encodedString ?? ""){
            print(url)
            cell.artistImg.kf.setImage(with: url)
            cell.artistImg.kf.indicatorType = .activity
        }
        if arrayOfVideos[indexPath.row].liked {
            
            cell.thumbsUpButton.setImage(#imageLiteral(resourceName: "Group 365").withRenderingMode(.alwaysOriginal), for: [])
        }
        else{
            
            cell.thumbsUpButton.setImage(#imageLiteral(resourceName: "thumbs-up").withRenderingMode(.alwaysOriginal), for: [])

        }
        cell.numberofthumbsUp.text = "\(arrayOfVideos[indexPath.row].likes)"
        cell.numberOfviews.text = "\(arrayOfVideos[indexPath.row].views)"
        cell.thumbsUpButton.tag = indexPath.row
        cell.thumbsUpButton.addTarget(self, action: #selector(handleThumbs(thumbsUpButton:)), for: .touchUpInside)
        return cell
    }
    @objc func handleThumbs(thumbsUpButton:UIButton){
//        self.arrayOfThumbsUp.append((thumbsUp(row: thumbsUpButton.tag, isLiked: true)))

        arrayOfThumbsUp[thumbsUpButton.tag].isLiked = !arrayOfThumbsUp[thumbsUpButton.tag].isLiked
        if arrayOfThumbsUp[thumbsUpButton.tag].isLiked{
            thumbsUpButton.setImage(#imageLiteral(resourceName: "Group 365").withRenderingMode(.alwaysOriginal), for: [])
        }
        else{
            thumbsUpButton.setImage(#imageLiteral(resourceName: "thumbs-up").withRenderingMode(.alwaysOriginal), for: [])
        }
        for data in arrayOfThumbsUp{
            print(data.isLiked)
            
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "videosHeaderForSlider") as! videosHeaderForSlider
        header.arrayOfVideos = self.sliderData
        header.PageController.numberOfPages = self.sliderData.count
        header.parentVC = self
        header.sliderCollectionView.reloadData()
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerImg
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string:arrayOfVideos[indexPath.row].video){
            
            let player = AVPlayer(url: url)
            let controller = AVPlayerViewController()
            controller.player = player
            present(controller, animated: true) {
                <#code#>
            }
            

    }
        
}
    
    
}


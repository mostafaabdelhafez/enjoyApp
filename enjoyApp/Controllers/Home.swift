//
//  Home.swift
//  enjoyApp
//
//  Created by Mostafa on 14/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class Home: UIViewController {

    let backgroundImg:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "Mask Group 6")
        image.isUserInteractionEnabled = true
        return image
    }()
    let sideMenuButton:UIButton = {
        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.setImage(#imageLiteral(resourceName: "icons-menu").withRenderingMode(.alwaysOriginal), for: [])
        return button
    }()
    
    let notificationButton:UIButton = {
        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.setImage(#imageLiteral(resourceName: "notifications").withRenderingMode(.alwaysOriginal), for: [])

        return button
    }()
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
        videosTableView.Anchor(Top: HomeTitle.bottomAnchor, Left: backgroundImg.leftAnchor, Bottom: view.bottomAnchor, Right: backgroundImg.rightAnchor, TopPadding: 25, LeftPadding: 0, BottomPadding: -10, RightPadding: 0, Width: 0, Height: 0)


//        UIColor(red: /255, green: /255, blue: /255, alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
//        view.backgroundColor = .white
        view.backgroundColor = UIColor(red: 174/255, green: 88/255, blue: 159/255, alpha: 1)
        setupConstraints()
        videosTableView.delegate = self
        videosTableView.dataSource = self
        videosTableView.isScrollEnabled = true
        videosTableView.backgroundColor = .clear
        videosTableView.register(videosHeaderForSlider.self, forHeaderFooterViewReuseIdentifier: "videosHeaderForSlider")
        videosTableView.register(UITableViewCell.self, forCellReuseIdentifier: "h")
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "h", for: indexPath) as! UITableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "videosHeaderForSlider") as! videosHeaderForSlider
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
}


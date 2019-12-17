//
//  sideMenu.swift
//  enjoyApp
//
//  Created by Mostafa on 16/12/2019.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class sideMenuController: UIViewController {
    
    let sideMenuNames = ["Home","My Orders","Artists","Request","cog Setting","Support","About App","Share App"]
    @IBOutlet weak var sideMeuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMeuTable.register(userInfoHeader.self, forHeaderFooterViewReuseIdentifier: "userInfoHeader")
        sideMeuTable.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
}
extension sideMenuController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! sideMenuCell
        cell.icon.isHidden = true
        cell.Name.text = sideMenuNames[indexPath.row]
        cell.selectionStyle = .none
        if indexPath.row == 7 {
            cell.icon.isHidden = false
            cell.icon.image = #imageLiteral(resourceName: "share")
        }
        
        if indexPath.row == 5 {
            cell.icon.isHidden = false
            cell.icon.image = #imageLiteral(resourceName: "Union 1")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "userInfoHeader") as! userInfoHeader
        header.contentView.backgroundColor = .clear
        header.backgroundColor = .clear
        header.backgroundView?.backgroundColor = .clear
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
        
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 7{
            let activtycontroller = UIActivityViewController(activityItems: [""], applicationActivities: nil)
                 present(activtycontroller, animated: true, completion: nil)
        }
    }
    
}

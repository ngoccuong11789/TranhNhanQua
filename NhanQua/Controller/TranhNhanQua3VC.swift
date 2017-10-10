//
//  TranhNhanQua3VC.swift
//  NhanQua
//
//  Created by Rea Won Kim on 8/27/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SVProgressHUD
import AssistantKit
class TranhNhanQua3VC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBarBtn: UIBarButtonItem!
    var imageURLs = [String]()
    let cellSpacingHeight: CGFloat = 10
    let device = Device.type
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        if revealViewController() != nil {
            menuBarBtn.target = self.revealViewController()
            menuBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        imageURLs = ["https://2.bp.blogspot.com/-6QWst_X-TxE/Wa55ryYeGeI/AAAAAAAABrA/IizExiOWp6IVG-pExsG7e4IZqahsSL5sACLcBGAs/s1600/21.png", "https://1.bp.blogspot.com/-fva7u7x5xwQ/Wa55r1XNzQI/AAAAAAAABrE/3b3DRPCNvVA77KbhjTcIR7Q2NlUp7ysNACLcBGAs/s1600/22.png", "https://4.bp.blogspot.com/-Me0BSOXei9k/Wa55sMuzM_I/AAAAAAAABrI/CUp0WRHhlJEm21pC2TKLWzQYI7pOBBvawCLcBGAs/s1600/23.png", "https://4.bp.blogspot.com/-roxiJudu8Vs/Wa55s-foMDI/AAAAAAAABrM/M3el0tQKqhEDql34NO6DGn9dCx6BXojLQCLcBGAs/s1600/24.png", "https://2.bp.blogspot.com/-x9lPZewZGok/Wa55s9XRBzI/AAAAAAAABrQ/lQmS7p7K4XQ8fQFQf6dqb_Gy1RSXq14MgCLcBGAs/s1600/25.png", "https://2.bp.blogspot.com/-m9iBO7f9skA/Wa55syeydGI/AAAAAAAABrU/NOnzKJF5FmwH0VvkU3fs37O8v_XJ4rDnwCLcBGAs/s1600/26.png", "https://3.bp.blogspot.com/-it5mHISZ99Y/Wa55truFp5I/AAAAAAAABrY/ppGc-k088sgsMG8-2JuuVxZZ2dI9DsR6gCLcBGAs/s1600/27.png", "https://1.bp.blogspot.com/-4Rz2Fqk_kVc/Wa55tvPankI/AAAAAAAABrc/JIUmBRIsxswfbdlHAfIezzA0diNFAQcXQCLcBGAs/s1600/28.png", "https://4.bp.blogspot.com/-99XcKw140Os/Wa55tyXbLbI/AAAAAAAABrg/t9y7FqCe7Rk6iyIeEUd_NbPRwapjEiL8QCLcBGAs/s1600/29.png", "https://2.bp.blogspot.com/-oo3nteqj2FY/Wa55unQ9UPI/AAAAAAAABro/cI_s1mpBZaY12bxZV5yHwmjI5JzfYj-cwCLcBGAs/s1600/30.png"]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable(tableView: tableView)
    }
}

extension TranhNhanQua3VC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return imageURLs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TranhNhanQuaCell3 else {
            return UITableViewCell()
        }
        let imageView = cell.viewWithTag(1) as? UIImageView
        SVProgressHUD.show(withStatus: "Loading...")
        imageView?.sd_setImage(with: URL(string: imageURLs[indexPath.section]), completed: { (image, error , cacheType , imageURL) in
            SVProgressHUD.dismiss()
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animateCellForRow(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch device {
        case .phone:      return 640
        case .pad:        return 1000
        default:          return 640
        }
    }
}

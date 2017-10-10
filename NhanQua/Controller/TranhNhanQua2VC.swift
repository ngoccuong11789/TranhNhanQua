//
//  TranhNhanQua2VC.swift
//  NhanQua
//
//  Created by Rea Won Kim on 8/27/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SVProgressHUD
import AssistantKit
class TranhNhanQua2VC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
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
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        imageURLs = ["https://4.bp.blogspot.com/-m_jfSERIDLY/Wa55oBOrSVI/AAAAAAAABqU/7LK_31Om_o41ufZnzaRYgDCcpwcB90UIQCLcBGAs/s1600/11.png", "https://1.bp.blogspot.com/-Pto5VfxxJkY/Wa55oy5Mh0I/AAAAAAAABqY/jIG4FRIT0e8xeLQQYItUKyApo3aXxF2nQCLcBGAs/s1600/12.png", "https://1.bp.blogspot.com/-KkckMD4eMvQ/Wa55pZMCE2I/AAAAAAAABqc/NjNRfxVSvfE0UVmIi0c620w68fEYm_tzACLcBGAs/s1600/13.png", "https://2.bp.blogspot.com/-075XXN6AhXs/Wa55psfHQxI/AAAAAAAABqg/H-W7OH14KT4o0WumnR8ZByhbPn9k2BB8QCLcBGAs/s1600/14.png", "https://1.bp.blogspot.com/-kKix9lv1a4M/Wa55p9VD1sI/AAAAAAAABqk/RSg7qoZ4QAEh25_E29aw0gBj0dNAs43cgCLcBGAs/s1600/15.png", "https://1.bp.blogspot.com/-ratrO7RaaW8/Wa55qAimvNI/AAAAAAAABqo/wYO76iOXRfQJnuyNspQZKkyISDq1uqlZwCLcBGAs/s1600/16.png", "https://4.bp.blogspot.com/-MI5l6D3I8vI/Wa55qbvmcrI/AAAAAAAABqs/aYUdeU0kKb4ml_Oc5UY0Wcjvz9ODij8hwCLcBGAs/s1600/17.png", "https://4.bp.blogspot.com/-8H5eE008sqQ/Wa55qrE3HiI/AAAAAAAABqw/2p38v-2fXuICiEyO9jn9EC22yMHgWztfwCLcBGAs/s1600/18.png", "https://4.bp.blogspot.com/-Rycw_g_m290/Wa55rBfa4wI/AAAAAAAABq0/F4UEsgznXCkE6FP2p8kUm6zmxsnlF_55gCLcBGAs/s1600/19.png", "https://1.bp.blogspot.com/-tRzZyT2G3Ck/Wa55raxlo0I/AAAAAAAABq8/zeCnrvB91pUynKOhzBh4Zo0ErWjg-rZZQCLcBGAs/s1600/20.png"]  
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable(tableView: tableView)
    }

}

extension TranhNhanQua2VC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return imageURLs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TranhNhanQuaCell2 else {
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


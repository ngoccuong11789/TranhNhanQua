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
        
        imageURLs = [ "https://1.bp.blogspot.com/-4Rz2Fqk_kVc/Wa55tvPankI/AAAAAAAABrc/JIUmBRIsxswfbdlHAfIezzA0diNFAQcXQCLcBGAs/s1600/28.png", "https://4.bp.blogspot.com/-99XcKw140Os/Wa55tyXbLbI/AAAAAAAABrg/t9y7FqCe7Rk6iyIeEUd_NbPRwapjEiL8QCLcBGAs/s1600/29.png", "https://2.bp.blogspot.com/-oo3nteqj2FY/Wa55unQ9UPI/AAAAAAAABro/cI_s1mpBZaY12bxZV5yHwmjI5JzfYj-cwCLcBGAs/s1600/30.png", "https://1.bp.blogspot.com/-1mykOgWmbS4/Wa55vfQBMUI/AAAAAAAABrs/F_SJGjn9xjMhFOOMEWgN3mo8CCmdYuqJQCLcBGAs/s1600/31.png", "https://2.bp.blogspot.com/-KPR834GShvQ/Wa55vWOrn4I/AAAAAAAABrw/f73v4IQoTRwfRo52kcy_DpdVtY01PZINgCLcBGAs/s1600/32.png", "https://3.bp.blogspot.com/-cRlyANjGkds/Wa55v2M40UI/AAAAAAAABr0/FwXIfZ4Mv64Rn7oA1-K4lRSJxOfdM_iIACLcBGAs/s1600/33.png", "https://1.bp.blogspot.com/-d0xpcmYO3FU/Wa55wGQ1WxI/AAAAAAAABr4/oysAe9nFTuYpve9Y5WWBek42IJkotLwGQCLcBGAs/s1600/34.png", "https://1.bp.blogspot.com/-AAFmlBuLJXs/Wa55wKVff5I/AAAAAAAABr8/vyvWFRiRM88518Y5CPXMgq4q8dQ6kT2hgCLcBGAs/s1600/35.png", "https://2.bp.blogspot.com/-BxijsHQgX3M/Wa55wlM_d0I/AAAAAAAABsA/epH7j-wqQUsMRmYjG3yZqH_jWEQ_vzN0ACLcBGAs/s1600/36.png", "https://1.bp.blogspot.com/-WBFBNztwGGg/Wa55w7L6t2I/AAAAAAAABsE/4m4wrNGLFoY_UQh4syX8TkoFQYQ14fgAACLcBGAs/s1600/37.png", "https://3.bp.blogspot.com/-RdeCT6Rphrg/Wa55w93BsII/AAAAAAAABsI/AXCNwiNgr0Ijr8dMnfvN7mMQtYfmpLMZgCLcBGAs/s1600/38.png", "https://2.bp.blogspot.com/-lHjgL0FlAHE/Wa55x_yjTLI/AAAAAAAABsM/4xWEHvaPiEknT9YceFp4Z41o2kSNNPXCACLcBGAs/s1600/39.png", "https://4.bp.blogspot.com/-wTdl4IjPFys/Wa55yYFOtoI/AAAAAAAABsU/R4Ja7GZfEJUvHc-Kv-119ootbHSxatZTgCLcBGAs/s1600/40.png", "https://2.bp.blogspot.com/-K8a9xS1ir70/Wa55yjnpViI/AAAAAAAABsY/p52v-5AE-iICLRBjzd_x9iGCLik_6-P6wCLcBGAs/s1600/41.png", "https://2.bp.blogspot.com/-6Q5KK1MFsoE/Wa55zT_3g2I/AAAAAAAABsc/IOLZavg6N8IJRkyfwZ7D2Mn70o8VvznRQCLcBGAs/s1600/42.png", "https://1.bp.blogspot.com/-5z1zR6jQXos/Wa55zf-j5fI/AAAAAAAABsg/Xmz_JK1EAacY_H2_Ej4GKncpLHgr-HegwCLcBGAs/s1600/43.png"]
        
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
        default:          return 1500
        }
    }
}

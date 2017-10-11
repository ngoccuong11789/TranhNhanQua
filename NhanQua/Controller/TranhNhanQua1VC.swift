//
//  TranhNhanQua1VC.swift
//  NhanQua
//
//  Created by Rea Won Kim on 8/27/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SVProgressHUD
import AssistantKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
class TranhNhanQua1VC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    var imageURLs = [String]()
    let cellSpacingHeight: CGFloat = 10
    var imageView = UIImageView()
    let device = Device.type
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(TranhNhanQua1VC.pushToVC2), name: notificationName1, object: nil)
        
        // Do any additional setup after loading the view.
        if revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        imageURLs = ["https://4.bp.blogspot.com/--Yjcji0CewQ/Wa55TCsJvfI/AAAAAAAABqI/JMHQh2Bv3D0XmR2i_oMMQeekHUJo-AkWwCLcBGAs/s1600/BG.png","https://2.bp.blogspot.com/-zMJSdjJAf_0/Wa55oJBu6LI/AAAAAAAABqM/2UJ1QTyfm28KNbsWo72GACvky4OAIr49QCLcBGAs/s1600/1.png", "https://1.bp.blogspot.com/-tUbDRFXIml4/Wa55rA7fSUI/AAAAAAAABq4/bzoZwFQMIdoKcl7RcCVTiAaAQx5pp1zMACLcBGAs/s1600/2.png", "https://4.bp.blogspot.com/-xL_NZ51kSzg/Wa55uTH-M0I/AAAAAAAABrk/6zz9Kr-A4DQfVUFzP55XckKZwCpC6NnOQCLcBGAs/s1600/3.png", "https://4.bp.blogspot.com/-e1WQ9uEA5i4/Wa55ybfdHUI/AAAAAAAABsQ/UpBa09h0dGQwbfyMxWOJi8iD04rcNJKLACLcBGAs/s1600/4.png", "https://2.bp.blogspot.com/-lfAMTrF4f3M/Wa55zRU3OuI/AAAAAAAABsk/7dgYmuG9Ic0QhBUAVOiOltsjwhpXMC--gCLcBGAs/s1600/5.png", "https://2.bp.blogspot.com/-JmhrpEl4e4w/Wa550YrjqFI/AAAAAAAABso/w1445hjpvrYx0EL1jEnlBchPc0ZILc36gCLcBGAs/s1600/6.png", "https://3.bp.blogspot.com/-ohykdP9rPJ8/Wa5506P2LtI/AAAAAAAABss/xEnNMwN7VnMa3nadfxiQyCIIm4s8TJMuQCLcBGAs/s1600/7.png", "https://1.bp.blogspot.com/-HBWCXPFiCDs/Wa5500CCF3I/AAAAAAAABsw/Acc9stS5CkMuRsWzKW2VTqRImTGKWM0EgCLcBGAs/s1600/8.png", "https://4.bp.blogspot.com/-3MjKW8AI4Ks/Wa551C9vr9I/AAAAAAAABs0/8DvcQ6GyOWw64hTz71_u1iAecuazJCmFwCLcBGAs/s1600/9.png", "https://1.bp.blogspot.com/-JB7KLbyQy64/Wa55oEh775I/AAAAAAAABqQ/-s76Dph6olcnBdmWceiJKYDMizmmE0eJQCLcBGAs/s1600/10.png"]
        
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable(tableView: tableView)
    }
    
    func pushToVC2() {
        performSegue(withIdentifier: "pushToVC2", sender: nil)
        
    }
}

extension TranhNhanQua1VC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return imageURLs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TranhNhanQuaCell1 else {
            return UITableViewCell()
        }
        imageView = (cell.viewWithTag(1) as? UIImageView)!
        SVProgressHUD.show(withStatus: "Loading...")

        imageView.sd_setImage(with: URL(string: imageURLs[indexPath.section]), completed: { (image, error , cacheType , imageURL) in
            
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

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

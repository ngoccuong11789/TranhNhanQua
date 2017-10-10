//
//  ReaWonKimVC.swift
//  TranhNhanQua
//
//  Created by Rea Won Kim on 9/7/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SMWebView
import SVProgressHUD
class ReaWonKimVC: BaseViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    var loadingURLString = "http://www.reawonkim.net/"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        let webView = SMWebView()
        loadingWebView(webView: webView, stringURL: loadingURLString)
        webView.frame = UIScreen.main.bounds
        self.view.addSubview(webView)
        
    }
    

}


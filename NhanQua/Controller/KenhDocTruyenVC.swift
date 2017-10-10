//
//  KenhDocTruyenVC.swift
//  TranhNhanQua
//
//  Created by Rea Won Kim on 9/7/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SMWebView
import SVProgressHUD
import SnapKit
class KenhDocTruyenVC: BaseViewController {
    var loadingURLString = "https://www.youtube.com/watch?v=NMOCpBjOkC0&t=1s&index=1&list=PLZDMEsu2Hm2w3qc_P2dz7LJYVKtNXHewF"
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        webView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }

    

}

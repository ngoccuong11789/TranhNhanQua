//
//  ViewController.swift
//  NhanQua
//
//  Created by Rea Won Kim on 8/27/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var MenuBtn: UIBarButtonItem!
    var getIndex = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MenuBtn.target = self.revealViewController()
        MenuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if getIndex == 0 {
            label.text = "Tranh Nhân Quả 1"
        }else {
            label.text = "Tranh Nhân Quả \(getIndex + 1)"
        }
    }



}


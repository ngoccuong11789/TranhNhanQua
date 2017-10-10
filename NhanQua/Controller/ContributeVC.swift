//
//  ContributeVC.swift
//  TranhNhanQua
//
//  Created by Rea Won Kim on 9/9/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import AssistantKit
import SVProgressHUD
class ContributeVC: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet var carouselView: iCarousel!
    var number = [Int]()
    var backgroundImage = [String]()
    var nameTitle = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        //number = [1, 2, 3, 4, 5, 6]
        backgroundImage = ["cuong", "em", "bame","Noi"]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        carouselView.type = .coverFlow
        if revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        SVProgressHUD.dismiss()
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return backgroundImage.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var tempView = UIView()
        var button = UIButton()
           
        let version = Device.version
        
        switch version {
        case .phone4:       
        tempView =  UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
        button   = UIButton(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
        case .phone4S:      
        tempView =  UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
        button   = UIButton(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
        case .phone5, .phone5C, .phone5S, .phoneSE:       
        tempView =  UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        button   = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            
        case .phone6, .phone6S, .phone6Plus, .phone6SPlus: 
            tempView =  UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
            button   = UIButton(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
            
        case .pad1, .pad2, .pad3, .pad4, .padAir, .padAir2, .padMini2, .padMini3, .padMini4, .padPro:      tempView =  UIView(frame: CGRect(x: 0, y: 0, width: 550, height: 550))
        button   = UIButton(frame: CGRect(x: 0, y: 0, width: 550, height: 550))
        
            
        default:            
            tempView =  UIView(frame: CGRect(x: 0, y: 0, width: 380, height: 380))
            button   = UIButton(frame: CGRect(x: 0, y: 0, width: 380, height: 380))
        }
        
        tempView.backgroundColor = UIColor.blue
//        button.titleEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0)
        button.setBackgroundImage(UIImage(named: backgroundImage[index]), for: UIControlState.normal)
        tempView.addSubview(button)
        return tempView
    }

    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        return value
    }
    

}

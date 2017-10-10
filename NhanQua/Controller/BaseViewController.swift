//
//  BaseViewController.swift
//  TranhNhanQua
//
//  Created by Rea Won Kim on 9/1/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SMWebView
import SVProgressHUD
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.backgroundColor = .white
        //navigationController?.navigationBar.isTranslucent = false
    }

    func animateTable(tableView: UITableView!) {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }

    func animateCellForRow(cell : UITableViewCell) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.0) { 
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func loadingWebView(webView : SMWebView, stringURL : String) {
        webView
            .loadURL(URL(string: stringURL)!)
            .didStartLoading(handler: { (webView) in
                SVProgressHUD.show(withStatus: "Loading...")
            })
            .didCompleteLoading { webView in
                SVProgressHUD.dismiss()
            }
            .didFinishLoading { (webView) in
                SVProgressHUD.dismiss()
        }
    }

}

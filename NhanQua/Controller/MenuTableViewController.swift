//
//  MenuTableViewController.swift
//  NhanQua
//
//  Created by Rea Won Kim on 8/27/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import Foundation

class MenuTableViewController: UITableViewController {
    
    var menuDataArray = [String]()
    let cellTitle_1 = NSLocalizedString("Cause & Effect Picture 1", comment: "")
    let cellTitle_2 = NSLocalizedString("Cause & Effect Picture 2", comment: "")
    let cellTitle_3 = NSLocalizedString("Cause & Effect Picture 3", comment: "")
    let cellTitle_4 = NSLocalizedString("Cause & Effect Picture 4", comment: "")
    let cellTitle_5 = NSLocalizedString("Buddhist Story", comment: "")
    let cellTitle_6 = NSLocalizedString("Rea Won Kim Website", comment: "")
    let cellTitle_7 = NSLocalizedString("Contributors", comment: "")
    var menuCell = ["MenuCell1", "MenuCell2", "MenuCell3", "MenuCell4", "MenuCell5", "MenuCell6", "MenuCell7"]
    override func viewDidLoad() {
        menuDataArray = [cellTitle_1, cellTitle_2, cellTitle_3, cellTitle_4, cellTitle_5, cellTitle_6, cellTitle_7]
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgTable")!)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCell[indexPath.row], for: indexPath) as UITableViewCell
        cell.textLabel?.text = menuDataArray[indexPath.row]
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let DestVC = segue.destination as? ViewController
//        let indexPath : NSIndexPath = (self.tableView.indexPathForSelectedRow as NSIndexPath?)!
//        DestVC?.getIndex = indexPath.row
//    }
    //https://medium.com/lean-localization/ios-localization-tutorial-938231f9f881
}

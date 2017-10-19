//
//  Backgroundslider.swift
//  TranhNhanQua
//
//  Created by Rea Won Kim on 10/18/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import Foundation

class backgroundSlider: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.rgb(167, green: 144, blue: 115).cgColor
    }
    
}

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

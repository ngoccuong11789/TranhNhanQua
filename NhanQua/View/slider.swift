//
//  slider.swift
//  TranhNhanQua
//
//  Created by Rea Won Kim on 10/18/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import Foundation
import UIKit

final class SliderMaterial: UISlider {
    override func awakeFromNib() {
        super.awakeFromNib()
        setThumbImage(UIImage(named: "slider"), for: UIControlState.normal)
        minimumTrackTintColor = UIColor.rgb(241, green: 204, blue: 92)
        maximumTrackTintColor = UIColor.rgb(123, green: 85, blue: 51)
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: 4))
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds: CGRect = self.bounds
        bounds = bounds.insetBy(dx: -10, dy: -15)
        return bounds.contains(point)
    }
}

//
//  ECategory.swift
//  Daily
//
//  Created by Яна Латышева on 10.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit


struct ECategory {
    
    var name: String
//    var image: UIImage?
    var color: UIColor?
    var colorHex: String? {
        get {
            return color?.toHexString()
        }
        set {
            if let hexValue = newValue {
                color = UIColor(hexRGB: hexValue)
            }
        }
    }
    
}

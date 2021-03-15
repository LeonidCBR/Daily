//
//  ECategory.swift
//  Daily
//
//  Created by Яна Латышева on 10.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import RealmSwift


class Category: Object {
    
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var name: String = ""
    @objc dynamic var colorHex: String = UIColor.blue.toHexString()
    //let events = List<Event>();
    
//    var image: UIImage?
    var color: UIColor? {
        get {
            return UIColor(hexRGB: colorHex)
        }
        set {
            if let color = newValue {
                colorHex = color.toHexString()
            }
        }
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
}

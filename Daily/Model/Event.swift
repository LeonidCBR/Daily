//
//  Event.swift
//  Daily
//
//  Created by Яна Латышева on 09.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import Foundation
import RealmSwift


class Event: Object {
    
    @objc dynamic var _id: ObjectId = ObjectId.generate()
    @objc dynamic var text: String = ""
    
    // let ?
    //var category = LinkingObjects(fromType: Category.self, property: "events")
    @objc dynamic var category: Category? = nil
//    let datetime: Date
    //let category: ECategory
    
    override static func primaryKey() -> String? {
        return "_id"
    }
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    convenience init(text: String, category: Category?) {
        self.init()
        self.text = text
        self.category = category
    }
}

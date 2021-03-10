//
//  PersistentManager.swift
//  Daily
//
//  Created by Яна Латышева on 07.02.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import Foundation
import RealmSwift

struct PersistentManager {
    
    // MARK: - Properties
    private let realm = try! Realm()
    
    static let shared = PersistentManager()
    private init() {
    }
    
    
    // MARK: - Methods
    
    /**
     Work with categories
     */
    
    func fetchCategories() -> Results<Category> {
        return realm.objects(Category.self)
    }
    
    func addCategory(_ category: Category) throws {
        try realm.write() {
            realm.add(category)
        }
    }
    
    func deleteCategory(_ category: Category) throws {
        try realm.write {
            realm.delete(category)
        }
    }
    
    /**
     Work with Events
     */
    
    func fetchEvents() -> Results<Event> {
        return realm.objects(Event.self)
    }
    
    func addEvent(_ event: Event) throws {
        try realm.write() {
            realm.add(event)
        }
    }
    
    func deleteEvent(_ event: Event) throws {
        try realm.write {
            realm.delete(event)
        }
    }
}

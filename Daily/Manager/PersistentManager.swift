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
    
    func fetchCategories() -> Results<Category> {
        print("DEBUG: \(#function) Fetching categories...")
        
        // TODO: - fetch in the background mode
        
        return realm.objects(Category.self)
    }
    
    func addCategory(_ category: Category) throws {
        try realm.write() {
            realm.add(category)
            print("DEBUG: \(#function) Category is added.")
        }
    }
    
    func deleteCategory(_ category: Category) throws {
        try realm.write {
            realm.delete(category)
            print("DEBUG: \(#function) Category is deleted.")
        }
    }
}

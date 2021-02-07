//
//  CategoriesController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class CategoriesController: BaseController {

    // MARK: - Properties
    private let categoryCellIdentifier = "CategoryCell"
    
    private var categories: [ECategory] = [ECategory(name: "Важные покупки", color: .red),
                                           ECategory(name: "Разное"),
                                           ECategory(name: "Поздравить", color: .blue)]
    
    
    // MARK: - UI Properties
    private let categoriesTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .mainBlue
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cells for events
        categoriesTable.register(CategoryCell.self, forCellReuseIdentifier: categoryCellIdentifier)
        
        // Set up delegate
        categoriesTable.delegate = self
        categoriesTable.dataSource = self
        
        configureUI()
    }
    

    // MARK: - Methods
    private func configureUI() {
        
        headerLabel.text = "Категории"
  
        // Add table with categories
        view.addSubview(categoriesTable)
        // safeAreaLayoutGuide
        // layoutMarginsGuide
        categoriesTable.anchor(top: topImage.bottomAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }

}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension CategoriesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier, for: indexPath) as! CategoryCell
        cell.categoryText.text = categories[indexPath.row].name
        cell.colorCircle.backgroundColor = categories[indexPath.row].color
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row[\(indexPath.row)] is selected")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            categories.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }        
    }
    
}

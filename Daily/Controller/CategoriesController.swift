//
//  CategoriesController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class CategoriesController: UIViewController {

    // MARK: - Properties
    private let categoryCellIdentifier = "CategoryCell"
    
    private var categories: [ECategory] = [ECategory(name: "Важные покупки", color: .red),
                                           ECategory(name: "Разное"),
                                           ECategory(name: "Поздравить", color: .blue)]
    
    
    // MARK: - UI Properties
    private let topImage: UIImageView = {
        let imageView = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textColor = .white
        label.font = UIFont(name: "Verdana-Bold", size: 25.0)
        label.textAlignment = .center
        return label
    }()
    
    private let categoriesTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemTeal
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Categories"
        view.backgroundColor = .systemTeal
        
        // Register cells for events
        categoriesTable.register(CategoryCell.self, forCellReuseIdentifier: categoryCellIdentifier)
        
        // Set up delegate
        categoriesTable.delegate = self
        categoriesTable.dataSource = self
        
        setupView()
    }
    

    // MARK: - Methods
    private func setupView() {
        // Add top image
        view.addSubview(topImage)
        topImage.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        height: 150)
        
        // Add month label
        topImage.addSubview(headerLabel)
        headerLabel.anchor(centerX: topImage.centerXAnchor,
                          centerY: topImage.centerYAnchor)
        // (width: 150, height: 40, centerX: centerXAnchor, centerY: centerYAnchor)
        
        // Add table with categories
        view.addSubview(categoriesTable)
        // safeAreaLayoutGuide
        // layoutMarginsGuide
        categoriesTable.anchor(top: topImage.bottomAnchor,
                               bottom: view.layoutMarginsGuide.bottomAnchor,
                               leading: view.layoutMarginsGuide.leadingAnchor,
                               trailing: view.layoutMarginsGuide.trailingAnchor)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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
    
    /*
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //
    }
    */
}

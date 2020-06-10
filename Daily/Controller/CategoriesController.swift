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
    private let topImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
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

//        title = "Categories"
        view.backgroundColor = .systemTeal
        
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
        headerLabel.anchor(top: topImage.topAnchor, paddingTop: 50,
                          centerX: topImage.centerXAnchor)
        
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

//
//  MainTabBarController.swift
//  Daily
//
//  Created by Яна Латышева on 25.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    
    // MARK: - Methods
    
    func configureViewControllers() {

        let homeTab = HomeController()
        homeTab.tabBarItem = UITabBarItem(title: K.TabBarItem.home, image: UIImage(systemName: "calendar.circle"), tag: 0)
        
        let categoriesTab = CategoriesController()
        categoriesTab.tabBarItem = UITabBarItem(title: K.TabBarItem.categories, image: UIImage(systemName: "tray.full"), tag: 1)
        
        let settingsTab = SettingsController()
        settingsTab.tabBarItem = UITabBarItem(title: K.TabBarItem.settings, image: UIImage(systemName: "gear"), tag: 2)
        
        viewControllers = [homeTab, categoriesTab, settingsTab]
        selectedIndex = 0
    }
}

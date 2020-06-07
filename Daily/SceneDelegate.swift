//
//  SceneDelegate.swift
//  Daily
//
//  Created by Яна Латышева on 21.03.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        // was
//        window?.rootViewController = MainViewController()
        
        let tabBarController = UITabBarController()
        
        let mainTab = MainViewController()
//        let mainTab = UINavigationController(rootViewController: MainViewController())
        let tabBarItem1 = UITabBarItem(title: "Home", image: nil, tag: 0)
        mainTab.tabBarItem = tabBarItem1
        
        /*
        let tab2 = NewEventController()
        let tabBarItem2 = UITabBarItem(title: "New event", image: nil, tag: 1)
        tab2.tabBarItem = tabBarItem2
        */
        
        let categoriesTab = CategoriesController()
        let tabBarItem3 = UITabBarItem(title: "Categories", image: nil, tag: 2)
        categoriesTab.tabBarItem = tabBarItem3
        
        let settingsTab = SettingsController()
        let tabBarItem4 = UITabBarItem(title: "Settings", image: nil, tag: 3)
        settingsTab.tabBarItem = tabBarItem4
        
        tabBarController.viewControllers = [mainTab, categoriesTab, settingsTab]
        tabBarController.selectedIndex = 0
        
                
//        print(tabBarController.toolbarItems?.count)
        window?.rootViewController = tabBarController
        
        
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


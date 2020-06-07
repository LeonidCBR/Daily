//
//  NewEventControllerViewController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class NewEventController: UIViewController {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "New event"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "New event"
        view.backgroundColor = .red
        
//        let tbItem = UITabBarItem(title: "New event", image: nil, tag: 1)
//        tabBarItem = tbItem
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: view.topAnchor,
                           paddingTop: 50,
                           centerX: view.centerXAnchor)
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

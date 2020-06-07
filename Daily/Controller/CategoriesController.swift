//
//  CategoriesController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class CategoriesController: UIViewController {

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "Categories"
        view.backgroundColor = .blue
        
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

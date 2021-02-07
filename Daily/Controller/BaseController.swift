//
//  BaseController.swift
//  Daily
//
//  Created by Яна Латышева on 07.02.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import UIKit

/*
 This is a parent class
 */

class BaseController: UIViewController {

    // MARK: - Properties
    let topImage: UIImageView = {
        let imageView = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
        return imageView
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
//        label.text = "Настройки"
        label.textColor = .white
        label.font = UIFont(name: "Verdana-Bold", size: 25.0)
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .mainBlue
        //        view.backgroundColor = UIColor(hexRGB: "#341f97")
        
        configureUI()
    }
    

    // MARK: - Methods
    private func configureUI() {
        // Add top image
        view.addSubview(topImage)
        topImage.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        height: 150)
        
        // Add month label
        topImage.addSubview(headerLabel)
        //top: topImage.topAnchor, paddingTop: 50,
        headerLabel.anchor(centerX: topImage.centerXAnchor,
                           centerY: topImage.centerYAnchor)
    }

}

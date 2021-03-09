//
//  SettingsManager.swift
//  Daily
//
//  Created by Яна Латышева on 09.03.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import UIKit


class SettingsManager {
    
    // MARK: - Properties
    var mainImage: UIImage {
        didSet {
            NotificationCenter.default.post(name: .DAHeaderImageDidChange, object: nil)
        }
    }
    
    //private var mainImage = UIImageView(image: .init(imageLiteralResourceName: "sky-640"))
    static let shared = SettingsManager()
    
    private init() {
        mainImage = UIImage(imageLiteralResourceName: "sky-640")
    }
    
}

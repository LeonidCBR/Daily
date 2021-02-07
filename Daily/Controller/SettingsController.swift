//
//  SettingsController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class SettingsController: BaseController {

    // MARK: - Properties

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    // MARK: - Methods
    private func configureUI() {
        
        headerLabel.text = "Настройки"

    }

}

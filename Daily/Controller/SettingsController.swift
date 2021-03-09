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

    
    // TODO: - Add capability to change image
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    // MARK: - Methods
    private func configureUI() {
        
        headerLabel.text = "Настройки"
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: K.Identifier.menuOptionCell)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.menuOptionCell, for: indexPath) as! MenuOptionCell
        cell.menuOption = MenuOption(rawValue: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // TODO: - Show foto galary
        let menuOption = MenuOption(rawValue: indexPath.row)
        switch menuOption {
        case .Image:
            let vc = UIViewController()
            vc.view.backgroundColor = .systemPink
            present(vc, animated: true, completion: nil)
        
        case .none:
            print("DEBUG: Wrong raw value of the indexpath!")
        }
    }

}

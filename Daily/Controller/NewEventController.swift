//
//  NewEventControllerViewController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class NewEventController: UIViewController {

    // MARK: - Properties
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "New event"
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
//        button.tintColor = .gray
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
//        button.tintColor = .blue
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "New event"
        view.backgroundColor = .white
        
//        let tbItem = UITabBarItem(title: "New event", image: nil, tag: 1)
//        tabBarItem = tbItem
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: view.topAnchor, paddingTop: 50,
                           centerX: view.centerXAnchor)
        
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.topAnchor, paddingTop: 50,
                            leading: view.leadingAnchor, paddingLeading: 20)
        
        view.addSubview(saveButton)
        saveButton.anchor(top: view.topAnchor, paddingTop: 50,
                          trailing: view.trailingAnchor, paddingTrailing: 20)
    }
    
    
    // MARK: - Methods
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func saveButtonTapped() {
        print("Save event...")
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

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
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "New event"
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
//        button.setAttributedTitle(.init(string: "Attributed string"), for: .normal)
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
    /*
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.distribution = .equalSpacing
        stackView.alignment = .center
//        stackView.spacing = 10.0
        return stackView
    }()
    */
    
    private let eventText: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.placeholder = "Description"
        return textField
    }()
    
    private let eventDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Event's date"
        return label
    }()
    
    private let eventDate: UIDatePicker = {
        let dp = UIDatePicker()
        dp.locale = Locale(identifier: "ru_RU")
        dp.datePickerMode = .date
        return dp
    }()
    
    private let alertLabel: UILabel = {
        let label = UILabel()
        label.text = "Alert"
        return label
    }()
    
    private let alertDate: UIDatePicker = {
        let dp = UIDatePicker()
        dp.locale = Locale(identifier: "ru_RU")
        dp.datePickerMode = .dateAndTime
        return dp
    }()
    
    private let secondAlertLabel: UILabel = {
        let label = UILabel()
        label.text = "Second alert"
        return label
    }()
    
    private let secondAlertDate: UIDatePicker = {
        let dp = UIDatePicker()
        dp.locale = Locale(identifier: "ru_RU")
        dp.datePickerMode = .dateAndTime
        return dp
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "New event"
        view.backgroundColor = .white
        
//        let tbItem = UITabBarItem(title: "New event", image: nil, tag: 1)
//        tabBarItem = tbItem
        
        setupView()
        
    }
    
    
    // MARK: - Methods
    private func setupView() {
        
        view.addSubview(headerView)
        headerView.anchor(top: view.topAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor,
                          height: 100)
        
        headerView.addSubview(headerLabel)
        headerLabel.anchor(centerX: headerView.centerXAnchor, centerY: headerView.centerYAnchor)
        
        headerView.addSubview(cancelButton)
        cancelButton.anchor(leading: headerView.leadingAnchor, paddingLeading: 20,
                            centerY: headerView.centerYAnchor)
        
        headerView.addSubview(saveButton)
        saveButton.anchor(trailing: headerView.trailingAnchor, paddingTrailing: 20,
                          centerY: headerView.centerYAnchor)
        
        /*
        view.addSubview(mainStackView)
        mainStackView.anchor(top: headerView.bottomAnchor,
                               bottom: view.layoutMarginsGuide.bottomAnchor,
                               leading: view.layoutMarginsGuide.leadingAnchor,
                               trailing: view.layoutMarginsGuide.trailingAnchor)
         
        eventText.widthAnchor.constraint(equalToConstant: view.layoutMarginsGuide.layoutFrame.width).isActive = true
        eventText.heightAnchor.constraint(equalToConstant: 50).isActive = true
         
        eventDate.widthAnchor.constraint(equalToConstant: view.layoutMarginsGuide.layoutFrame.width).isActive = true
        eventDate.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        mainStackView.addArrangedSubview(eventText)
        mainStackView.addArrangedSubview(eventDate)
        
        // !!! может добавить внизу view-заглушку !!!
         
        */
        
        view.addSubview(eventText)
        eventText.anchor(top: headerView.bottomAnchor, paddingTop: 20,
                         leading: view.layoutMarginsGuide.leadingAnchor,
                         trailing: view.layoutMarginsGuide.trailingAnchor,
                         height: 50)
        
        view.addSubview(eventDateLabel)
        eventDateLabel.anchor(top: eventText.bottomAnchor, paddingTop: 20,
                              centerX: view.centerXAnchor)
                
        view.addSubview(eventDate)
        eventDate.anchor(top: eventDateLabel.bottomAnchor, paddingTop: 10,
                         leading: view.layoutMarginsGuide.leadingAnchor,
                         trailing: view.layoutMarginsGuide.trailingAnchor,
                         height: 150)
        
        view.addSubview(alertLabel)
        alertLabel.anchor(top: eventDate.bottomAnchor, paddingTop: 20,
                          centerX: view.centerXAnchor)
        
        view.addSubview(alertDate)
        alertDate.anchor(top: alertLabel.bottomAnchor, paddingTop: 10,
                         leading: view.layoutMarginsGuide.leadingAnchor,
                         trailing: view.layoutMarginsGuide.trailingAnchor,
                         height: 150)
        
        view.addSubview(secondAlertLabel)
        secondAlertLabel.anchor(top: alertDate.bottomAnchor, paddingTop: 20,
                                centerX: view.centerXAnchor)
        
        view.addSubview(secondAlertDate)
        secondAlertDate.anchor(top: secondAlertLabel.bottomAnchor, paddingTop: 10,
                               leading: view.layoutMarginsGuide.leadingAnchor,
                               trailing: view.layoutMarginsGuide.trailingAnchor,
                               height: 150)
    }
    
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func saveButtonTapped() {
        print("Save event...")
        
        
        UIView.animate(withDuration: 0.3) {
            self.alertDate.heightAnchor.constraint(equalToConstant: 0).isActive = true
            self.view.layoutIfNeeded()
        }
        
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

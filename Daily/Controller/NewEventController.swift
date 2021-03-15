//
//  NewEventControllerViewController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import RealmSwift

// TODO: - Set sections

// read "Creating self-sizing table view cells"
// read contentView



// TODO: - inherit from UITableView!!!


class NewEventController: UITableViewController {

    // MARK: - Properties
 
    private var categories: Results<Category>?
    private var category: Category?
    private var eventText: String?

/*
    private let textCellIdentifier = "NETextCell"
    private let labelsCellIdentifier = "NELabelsCell"
    private let pickerCellIdentifier = "NEPickerCell"
    private let datePickerCellIdentifier = "NEDatePickerCell"
    private let toggleCellIdentifier = "NEToggleCell"
    */

//    let rowDatePickerHeight: CGFloat = 216.0
//    let rowPickerViewHeight: CGFloat = 150.0
//    let rowTextFieldHeight: CGFloat = 60.0
//    let rowHeight: CGFloat = 43.5
    
    // Mutable heights for hidding rows
    //var datePickerHeight: CGFloat = 0.0
    var categoriesHeight: CGFloat = 0.0
    var eventDateHeight: CGFloat = 0.0
    var alertLabelHeight: CGFloat = 0.0
    var alertTimeHeight: CGFloat = 0.0
    
    
    // MARK: - UI Properties
 /*
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Новое событие"
        label.textColor = .mainBlue
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
//        button.setAttributedTitle(.init(string: "Attributed string"), for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
//        button.tintColor = .blue
        button.setTitleColor(.mainBlue, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
*/
    
//    private let mainTable: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .mainBlue
//        tableView.separatorStyle = .singleLine
//        tableView.separatorInset.left = 0
//        tableView.separatorInset.right = 0
//        return tableView
//    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let tbItem = UITabBarItem(title: "New event", image: nil, tag: 1)
//        tabBarItem = tbItem
        

        // Set up delegate
//        tableView.delegate = self
//        tableView.dataSource = self
        
        configureTableView()
        configureUI()
        configureTap()
        loadCategories()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        mainTable.separatorInset.left
//    }
    
    
    // MARK: - Methods
    
    private func loadCategories() {
        print("DEBUG: loading categories...")
        
        categories = PersistentManager.shared.fetchCategories()
        category = categories?.first
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .mainBlue
        tableView.separatorStyle = .singleLine
        tableView.separatorInset.left = 0
        tableView.separatorInset.right = 0
        
        // Register cells
        tableView.register(NETextCell.self, forCellReuseIdentifier: K.Identifier.textCell)
        tableView.register(NELabelsCell.self, forCellReuseIdentifier: K.Identifier.labelsCell)
        tableView.register(NEPickerCell.self, forCellReuseIdentifier: K.Identifier.pickerCell)
        tableView.register(NEDatePickerCell.self, forCellReuseIdentifier: K.Identifier.datePickerCell)
        tableView.register(NEToggleCell.self, forCellReuseIdentifier: K.Identifier.toggleCell)
        
    }
    
    private func configureUI() {
        
        title = "New Event"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        
        /*
        view.addSubview(headerView)
        headerView.anchor(top: view.topAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor,
                          height: 50)
        
        headerView.addSubview(headerLabel)
        headerLabel.anchor(centerX: headerView.centerXAnchor, centerY: headerView.centerYAnchor)
        
        headerView.addSubview(cancelButton)
        cancelButton.anchor(leading: headerView.leadingAnchor, paddingLeading: 20,
                            centerY: headerView.centerYAnchor)
        
        headerView.addSubview(saveButton)
        saveButton.anchor(trailing: headerView.trailingAnchor, paddingTrailing: 20,
                          centerY: headerView.centerYAnchor)
        */
//        view.addSubview(mainTable)
//        mainTable.anchor(top: headerView.bottomAnchor, paddingTop: 20,
//                         bottom: view.safeAreaLayoutGuide.bottomAnchor, // view.layoutMarginsGuide.bottomAnchor,
//                         leading: view.leadingAnchor,
//                         trailing: view.trailingAnchor)

    }
    
    private func configureTap() {
        // Hide keyboard when tap out of TextFields
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        /*
         There could be issues if you are dealing with tableviews and adding this tap gesture, selecting the rows, didSelectRowAtIndex path could not be fired until pressed long.
         Solution:
         
            tap.cancelsTouchesInView = false
         
         */
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    // MARK: - Selectors
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func saveButtonTapped() {
        print("DEBUG: Save button is tapped...")
        self.view.endEditing(true)
        
        guard let eventText = eventText else {
            // TODO: - Show message
            print("DEBUG: - Event's text is empty!")
            return
        }
        
//        UIView.animate(withDuration: 0.3) {
//            self.alertDate.heightAnchor.constraint(equalToConstant: 0).isActive = true
//            self.view.layoutIfNeeded()
//        }

        do {
//            let fake = Category(name: "YAHOO")
//            try PersistentManager.shared.addCategory(fake)
            
            let event = Event(text: eventText, category: category)
            try PersistentManager.shared.addEvent(event)
            dismiss(animated: true)

        } catch {
            // TODO: - Show error message
            print("DEBUG: ERROR saving context: \(error)")
        }
        
        
    }
    
    @objc func toggleTapped(_ sender: UISwitch) {
        // Hide alert
        UIView.animate(withDuration: 0.3) {
            self.alertLabelHeight = self.alertLabelHeight == 0 ? K.Height.row : 0
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: - MAKE REFACTORING!
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - MAKE REFACTORING!
        switch section {
        case 0:
            // Text of the new event
            return 1
        case 1:
            // Category
            return 2
        case 2:
            // Date of the new event
            return 2
        case 3:
            // Alert
            return 3
        default:
            fatalError("Wrong number of sections")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell
        // TODO: - MAKE REFACTORING!
        switch indexPath.section {
        case 0:
            // Create cell for text of new event
            let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.textCell, for: indexPath) as! NETextCell
            cell.delegate = self
            return cell
            
        case 1:
            if indexPath.row == 0 {
                // Create cell for chosen category
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.labelsCell, for: indexPath) as! NELabelsCell
                cell.leftLabel.text = "Категория:"
                cell.rightLabel.text = category?.name //"Важное"
                return cell
                
            } else {
                // List of categories
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.pickerCell, for: indexPath) as! NEPickerCell
                cell.pickerView.delegate = self
                cell.pickerView.dataSource = self
                cell.pickerView.heightAnchor.constraint(equalToConstant: K.Height.rowPickerView).isActive = true
                return cell
            }
            
        case 2:
            if indexPath.row == 0 {
                // Create cell for date of new event
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.labelsCell, for: indexPath) as! NELabelsCell
                cell.leftLabel.text = "Дата:"
                cell.rightLabel.text = "12.05.2020"
                return cell
                
            } else {
                // Event's date picker
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.datePickerCell, for: indexPath) as! NEDatePickerCell
                cell.datePicker.datePickerMode = .date
                cell.datePicker.heightAnchor.constraint(equalToConstant: K.Height.rowDatePicker).isActive = true
                return cell
            }
            
        case 3:
            // Alert
            if indexPath.row == 0 {
                // Create cell for reminder
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.toggleCell, for: indexPath) as! NEToggleCell
                cell.label.text = "Напомнить"
                cell.toggle.addTarget(self, action: #selector(toggleTapped), for: .valueChanged)
                return cell
                
            } else if indexPath.row == 1 {
                // Chosen date of the alert
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.labelsCell, for: indexPath) as! NELabelsCell
                cell.leftLabel.text = "Alert"
                cell.rightLabel.text = "12.05.2020 12:35"
                return cell
                
            } else {
                // Date picker of the alert
                let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifier.datePickerCell, for: indexPath) as! NEDatePickerCell
                cell.datePicker.datePickerMode = .dateAndTime
                cell.datePicker.heightAnchor.constraint(equalToConstant: K.Height.rowDatePicker).isActive = true
                return cell
            }
        default:
            fatalError("Wrong number of sections")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // check indexPath and hide or show rows
        // TODO: - MAKE REFACTORING!
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // tap to date
        if (indexPath.section == 1 && indexPath.row == 0) {
//            print("hide categories")
            UIView.animate(withDuration: 0.3) {
                // show or hide date picker
                self.categoriesHeight = self.categoriesHeight == 0 ? K.Height.rowPickerView : 0
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            
        } else if (indexPath.section == 2 && indexPath.row == 0) {
            print("hide event date")
            UIView.animate(withDuration: 0.3) {
                // show or hide date picker
                self.eventDateHeight = self.eventDateHeight == 0 ? K.Height.rowDatePicker : 0
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            
        } else if (indexPath.section == 3 && indexPath.row == 1) {
            print("hide alert time")
            UIView.animate(withDuration: 0.3) {
                // show or hide date picker
                self.alertTimeHeight = self.alertTimeHeight == 0 ? K.Height.rowDatePicker : 0
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // TODO: - MAKE REFACTORING!
        
        /*
         Section 0 -> Event text
         Section 1 -> Categories
         Section 2 -> Event date
         Section 1 -> Alert time
         */
        let row = indexPath.row
        
        switch indexPath.section {
        case 0 where row == 0: return K.Height.rowTextField
        case 1 where row == 1: return categoriesHeight
        case 2 where row == 1: return eventDateHeight
        case 3 where row == 1: return alertLabelHeight
        case 3 where row == 2: return alertTimeHeight
        default: return K.Height.row
        }
        
    }

}


// MARK: - UIPickerViewDataSource
extension NewEventController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories?[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("DEBUG: pickerView selected row \(row)")
        category = categories?[row]
        // TODO: - Make refactor!
        let indexPath = IndexPath(row: 0, section: 1)
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}


// MARK: - NETextCellDelegate
extension NewEventController: NETextCellDelegate {
    func textChanged(_ textCell: NETextCell, newText: String?) {
        eventText = newText
    }
}

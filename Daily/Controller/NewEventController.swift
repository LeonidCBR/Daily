//
//  NewEventControllerViewController.swift
//  Daily
//
//  Created by Яна Латышева on 07.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

// MOVE IT TO STANDALONE FILES !!!

// make new class for cell with toggle

// set height of cell and animation

// read "Creating self-sizing table view cells"
// read contentView

class NewEventTextCell: UITableViewCell {
    
    // MARK: - Properties
    let textEvent: UITextField = {
        let text = UITextField()
        text.borderStyle = .roundedRect
        return text
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .yellow
//        contentView.backgroundColor = .green
        
        addSubview(textEvent)
        textEvent.anchor(top: layoutMarginsGuide.topAnchor,
                         bottom: layoutMarginsGuide.bottomAnchor,
                         leading: layoutMarginsGuide.leadingAnchor,
                         trailing: layoutMarginsGuide.trailingAnchor)
//        textEvent.anchor(top: topAnchor, paddingTop: 0,
//                         bottom: bottomAnchor, paddingBottom: 0,
//                         leading: leadingAnchor, paddingLeading: 0,
//                         trailing: trailingAnchor, paddingTrailing: 0)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}



class NewEventLabelsCell: UITableViewCell {
    
    // MARK: - Properties
    let leftLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .blue
        
        addSubview(leftLabel)
        leftLabel.anchor(leading: layoutMarginsGuide.leadingAnchor,
                         centerY: centerYAnchor)
        
        addSubview(rightLabel)
        rightLabel.anchor(trailing: layoutMarginsGuide.trailingAnchor,
                          centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}



class NewEventToggleCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let toggle: UISwitch = {
        let sw = UISwitch()
        sw.isOn = true
        return sw
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .yellow
        
        addSubview(label)
        label.anchor(leading: layoutMarginsGuide.leadingAnchor,
                         centerY: centerYAnchor)
        
        addSubview(toggle)
        toggle.anchor(trailing: layoutMarginsGuide.trailingAnchor,
                          centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}



class NewEventPickerCell: UITableViewCell {
    // MARK: - Properties
    let pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .brown
        
        // TODO: - set up height
        
        addSubview(pickerView)
        pickerView.anchor(leading: leadingAnchor,
                          trailing: trailingAnchor,
//                          height: 100, // set up later
                          centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}



class NewEventDatePickerCell: UITableViewCell {
    
    // MARK: - Properties
    let datePicker: UIDatePicker = {
        let dPicker = UIDatePicker()
        // height = 216
        dPicker.locale = .init(identifier: "ru_RU")
        return dPicker
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .blue
        
        addSubview(datePicker)
        datePicker.anchor(leading: leadingAnchor,
                          trailing: trailingAnchor,
//                          height: 216, // set up later
                          centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}



class NewEventController: UIViewController {

    // MARK: - for test
    private var categories: [ECategory] = [ECategory(name: "Важные покупки", color: .red),
                                           ECategory(name: "Разное"),
                                           ECategory(name: "Поздравить", color: .blue)]
    
    // MARK: - Properties
    private let textCellIdentifier = "NewEventTextCell"
    private let labelsCellIdentifier = "NewEventLabelsCell"
    private let pickerCellIdentifier = "NewEventPickerCell"
    private let datePickerCellIdentifier = "NewEventDatePickerCell"
    private let toggleCellIdentifier = "NewEventToggleCell"

    let rowDatePickerHeight: CGFloat = 216.0
    let rowPickerViewHeight: CGFloat = 150.0
    let rowHeight: CGFloat = 43.5
    
    var datePickerHeight: CGFloat = 0.0
    
    
    // MARK: - UI Properties
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
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
//        button.tintColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let mainTable: UITableView = {
        let tableView = UITableView()
//        tableView.backgroundColor = .systemTeal
        tableView.separatorStyle = .singleLine
        tableView.separatorInset.left = 0
        tableView.separatorInset.right = 0
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "New event"
        view.backgroundColor = .white
        
//        let tbItem = UITabBarItem(title: "New event", image: nil, tag: 1)
//        tabBarItem = tbItem
        
        // Register cells
        mainTable.register(NewEventTextCell.self, forCellReuseIdentifier: textCellIdentifier)
        mainTable.register(NewEventLabelsCell.self, forCellReuseIdentifier: labelsCellIdentifier)
        mainTable.register(NewEventPickerCell.self, forCellReuseIdentifier: pickerCellIdentifier)
        mainTable.register(NewEventDatePickerCell.self, forCellReuseIdentifier: datePickerCellIdentifier)
        mainTable.register(NewEventToggleCell.self, forCellReuseIdentifier: toggleCellIdentifier)
        
        // Set up delegate
        mainTable.delegate = self
        mainTable.dataSource = self
        
        setupView()
        
    }
    
    
    // MARK: - Methods
    private func setupView() {
        
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
        
        view.addSubview(mainTable)
        mainTable.anchor(top: headerView.bottomAnchor, paddingTop: 20,
                         bottom: view.layoutMarginsGuide.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor)

    }
    
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func saveButtonTapped() {
        print("Save event...")
        
//        UIView.animate(withDuration: 0.3) {
//            self.alertDate.heightAnchor.constraint(equalToConstant: 0).isActive = true
//            self.view.layoutIfNeeded()
//        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        mainTable.separatorInset.left
    }

}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension NewEventController: UITableViewDelegate, UITableViewDataSource {
    
    // TODO: - That does NOT work
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        print("set")
//        return 50.0
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        //return 8 // !!! check
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            // Create cell for text of new event
            let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! NewEventTextCell
            return cell
            
        case 1:
            if indexPath.row == 0 {
                // Create cell for chosen category
                let cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath) as! NewEventLabelsCell
                cell.leftLabel.text = "Категория:"
                cell.rightLabel.text = "Важное"
                return cell
                
            } else {
                // List of categories
                let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellIdentifier, for: indexPath) as! NewEventPickerCell
                cell.pickerView.delegate = self
                cell.pickerView.dataSource = self
                cell.pickerView.heightAnchor.constraint(equalToConstant: rowPickerViewHeight).isActive = true
                return cell
            }
            
        case 2:
            if indexPath.row == 0 {
                // Create cell for date of new event
                let cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath) as! NewEventLabelsCell
                cell.leftLabel.text = "Дата:"
                cell.rightLabel.text = "12.05.2020"
                return cell
                
            } else {
                // Event's date picker
                let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellIdentifier, for: indexPath) as! NewEventDatePickerCell
                cell.datePicker.datePickerMode = .date
                cell.datePicker.heightAnchor.constraint(equalToConstant: rowDatePickerHeight).isActive = true
                return cell
            }
            
        case 3:
            // Alert
            if indexPath.row == 0 {
                // Create cell for reminder
                let cell = tableView.dequeueReusableCell(withIdentifier: toggleCellIdentifier, for: indexPath) as! NewEventToggleCell
                cell.label.text = "Напомнить"
                return cell
                
            } else if indexPath.row == 1 {
                // Chosen date of the alert
                let cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath) as! NewEventLabelsCell
                cell.leftLabel.text = "Alert"
                cell.rightLabel.text = "12.05.2020 12:35"
                return cell
                
            } else {
                // Date picker of the alert
                let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellIdentifier, for: indexPath) as! NewEventDatePickerCell
                cell.datePicker.datePickerMode = .dateAndTime
                cell.datePicker.heightAnchor.constraint(equalToConstant: rowDatePickerHeight).isActive = true
                return cell
            }
        default:
            fatalError("Wrong number of sections")
        }
        
        /*
        switch indexPath.row {
            
        case 0:
            // Create cell for text of new event
//            cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
            let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! NewEventTextCell
            return cell
            
        case 1:
            // Create cell for chosen category
//            cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath)
//            (cell as! NewEventLabelsCell).toggle.isHidden = true
//            (cell as! NewEventLabelsCell).leftLabel.text = "Категория:"
//            (cell as! NewEventLabelsCell).rightLabel.text = "Важное"
            let cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath) as! NewEventLabelsCell
            cell.leftLabel.text = "Категория:"
            cell.rightLabel.text = "Важное"
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: pickerCellIdentifier, for: indexPath) as! NewEventPickerCell
//            cell.pickerView.dataSource = self
            return cell
            
        case 3:
            // Create cell for date of new event
//            cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath)
//            (cell as! NewEventLabelsCell).leftLabel.text = "Дата:"
//            (cell as! NewEventLabelsCell).rightLabel.text = "12.05.2020"
            let cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath) as! NewEventLabelsCell
            cell.leftLabel.text = "Дата:"
            cell.rightLabel.text = "12.05.2020"
            return cell
            
        case 4:
            // event's date picker
            let cell = tableView.dequeueReusableCell(withIdentifier: datePickerCellIdentifier, for: indexPath) as! NewEventDatePickerCell
            cell.datePicker.datePickerMode = .date
            return cell
            
        case 5:
            // Create cell for reminder
//            cell = tableView.dequeueReusableCell(withIdentifier: labelsCellIdentifier, for: indexPath)
//            cell = NewEventLabelsCell(style: .default, reuseIdentifier: labelsCellIdentifier, showToggle: true)
//            (cell as! NewEventLabelsCell).leftLabel.text = "Напомнить:"
//            (cell as! NewEventLabelsCell).rightLabel.text = "Нет" //"13.05.2020 14:30"
            let cell = tableView.dequeueReusableCell(withIdentifier: toggleCellIdentifier, for: indexPath) as! NewEventToggleCell
            cell.label.text = "Напомнить"
            return cell
            
        case 6:
            let cell = NewEventLabelsCell()
            cell.leftLabel.text = "Alert"
            cell.rightLabel.text = "12.05.2020 12:35"
            return cell
            
        case 7:
            let cell = NewEventDatePickerCell()
            cell.datePicker.datePickerMode = .dateAndTime
            return cell
            
        default:
            fatalError("Wrong number of rows!")
//            let cell = UITableViewCell()
//            cell.backgroundColor = .systemPink
//            return cell
        }
        */
//        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // check indexPath and hide or show rows
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        if indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 7 {
        if (indexPath.section == 1 && indexPath.row == 1) {
            return rowPickerViewHeight
        } else if
            (indexPath.section == 2 && indexPath.row == 1) ||
            (indexPath.section == 3 && indexPath.row == 2) {
            // TODO: - change
            return rowDatePickerHeight
            
            //        } else if indexPath.row == 0 {
        } else if indexPath.section == 0 && indexPath.row == 0 {
            // set up the height of the cell with text field
            return 60
            
        } else {
            return rowHeight
        }
    }
}


// MARK: - UIPickerViewDataSource
extension NewEventController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//
//    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }
    
}

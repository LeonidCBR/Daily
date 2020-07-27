//
//  NewEventDatePickerCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class NEDatePickerCell: UITableViewCell {
    
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

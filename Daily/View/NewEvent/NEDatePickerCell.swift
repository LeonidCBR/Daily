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
        
        backgroundColor = .mainBlue
        clipsToBounds = true
        
        // height - 216
        contentView.addSubview(datePicker)
        datePicker.anchor(leading: contentView.leadingAnchor,
                          trailing: contentView.trailingAnchor,
                          height: K.Height.rowDatePicker,
                          centerX: contentView.centerXAnchor, // realy need???      ?????
                          centerY: contentView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//
//  NewEventPickerCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class NEPickerCell: UITableViewCell {
    // MARK: - Properties
    let pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .mainBlue
        clipsToBounds = true
        
        contentView.addSubview(pickerView)
        pickerView.anchor(leading: contentView.leadingAnchor,
                          trailing: contentView.trailingAnchor,
                          height: K.Height.rowPickerView,
                          centerX: contentView.centerXAnchor,
                          centerY: contentView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

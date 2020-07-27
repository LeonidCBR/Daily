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

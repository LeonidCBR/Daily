//
//  NewEventToggleCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class NEToggleCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let toggle: UISwitch = {
        let sw = UISwitch()
        sw.isOn = false
        return sw
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .mainBlue
        clipsToBounds = true
        
        contentView.addSubview(label)
        label.anchor(leading: contentView.layoutMarginsGuide.leadingAnchor,
                     centerY: contentView.centerYAnchor)
        
        contentView.addSubview(toggle)
        toggle.anchor(trailing: contentView.layoutMarginsGuide.trailingAnchor,
                      centerY: contentView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

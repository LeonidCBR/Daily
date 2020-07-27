//
//  NewEventTextCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class NETextCell: UITableViewCell {
    
    // MARK: - Properties
    let textEvent: UITextField = {
        let text = UITextField()
        text.textColor = .mainBlue
        text.borderStyle = .roundedRect
        return text
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .mainBlue
        clipsToBounds = true
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

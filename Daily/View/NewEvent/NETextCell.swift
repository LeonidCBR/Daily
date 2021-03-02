//
//  NewEventTextCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

protocol NETextCellDelegate {
    func textChanged(newText: String)
}

class NETextCell: UITableViewCell {
    
    // MARK: - Properties
    var delegate: NETextCellDelegate?
    
    lazy var textEvent: UITextField = {
        let text = UITextField()
        text.textColor = .mainBlue
        text.borderStyle = .roundedRect
        text.addTarget(self, action: #selector(textChanged), for: .editingDidEnd)
        return text
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .mainBlue
        clipsToBounds = true
//        contentView.backgroundColor = .green
        
        
        contentView.addSubview(textEvent)
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
    
    
    // MARK: - Methods
    @objc func textChanged() {
        print("DEBUG: - selector editingDidEnd is called")
        delegate?.textChanged(newText: textEvent.text ?? "")
    }
}

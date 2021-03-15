//
//  NewEventTextCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

protocol NETextCellDelegate {
    func textChanged(_ textCell: NETextCell, newText: String?)
}

class NETextCell: UITableViewCell {
    
    // MARK: - Properties
    var delegate: NETextCellDelegate?
    
    lazy var textEvent: UITextField = {
        let text = UITextField()
        text.textColor = .mainBlue
        text.borderStyle = .roundedRect
        text.keyboardType = .default
        text.addTarget(self, action: #selector(textChanged), for: .editingDidEnd)
        return text
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Methods
    private func configureUI() {
        
        backgroundColor = .mainBlue
        clipsToBounds = true
//        contentView.backgroundColor = .green
        
        
        contentView.addSubview(textEvent)
        textEvent.anchor(top: contentView.layoutMarginsGuide.topAnchor,
                         bottom: contentView.layoutMarginsGuide.bottomAnchor,
                         leading: contentView.layoutMarginsGuide.leadingAnchor,
                         trailing: contentView.layoutMarginsGuide.trailingAnchor)
//        textEvent.anchor(top: topAnchor, paddingTop: 0,
//                         bottom: bottomAnchor, paddingBottom: 0,
//                         leading: leadingAnchor, paddingLeading: 0,
//                         trailing: trailingAnchor, paddingTrailing: 0)

    }
    
//    func clearTextField() {
//        textEvent.text = ""
//    }
    
    // MARK: - Selectors
    
    @objc func textChanged() {
        print("DEBUG: - selector editingDidEnd is called")
        delegate?.textChanged(self, newText: textEvent.text)
    }
}

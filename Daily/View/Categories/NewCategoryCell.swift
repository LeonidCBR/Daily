//
//  NewCategoryCell.swift
//  Daily
//
//  Created by Яна Латышева on 06.03.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import UIKit

protocol NewCategoryCellDelegate {
//    func textChanged(_ textCell: NewCategoryCell, withTextField textField: UITextField, newText: String)
//    func didBeginEditing(_ textCell: NewCategoryCell, withTextField textField: UITextField)
    func didEndEditing(_ textCell: NewCategoryCell, withTextField textField: UITextField)
}

class NewCategoryCell: UITableViewCell {

    // MARK: - Properties
    var delegate: NewCategoryCellDelegate?
    
    lazy var textCategory: UITextField = {
        let text = UITextField()
        text.delegate = self
        text.textColor = .mainBlue
        text.borderStyle = .roundedRect
        text.keyboardType = .default
//        text.addTarget(self, action: #selector(textChanged), for: .editingDidEnd)
        return text
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    private func configureUI() {
        backgroundColor = .mainBlue
        clipsToBounds = true
        
        contentView.addSubview(textCategory)
//        textCategory.anchor(top: contentView.layoutMarginsGuide.topAnchor,
//                            bottom: contentView.layoutMarginsGuide.bottomAnchor,
//                            leading: contentView.layoutMarginsGuide.leadingAnchor,
//                            trailing: contentView.layoutMarginsGuide.trailingAnchor)
        textCategory.anchor(top: contentView.layoutMarginsGuide.topAnchor,
                            leading: contentView.layoutMarginsGuide.leadingAnchor,
                            trailing: contentView.layoutMarginsGuide.trailingAnchor,
                            height: 35.0)
        
        contentView.addSubview(slider)
        slider.anchor(top: textCategory.bottomAnchor, paddingTop: 15.0,
                      bottom: contentView.layoutMarginsGuide.bottomAnchor,
                      leading: contentView.layoutMarginsGuide.leadingAnchor,
                      trailing: contentView.layoutMarginsGuide.trailingAnchor)
    }
    
    func clearTextField() {
        textCategory.text = ""
    }

    
    // MARK: - Selectors
    /*
    @objc func textChanged() {
        print("DEBUG: - selector editingDidEnd is called")
        delegate?.textChanged(self, withTextField: self.textCategory, newText: textCategory.text ?? "")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
}



// MARK: - UITextFieldDelegate
extension NewCategoryCell: UITextFieldDelegate {
    
    // Begin editing
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("DEBUG: - \(#function)")
//        delegate?.didBeginEditing(self, withTextField: textField)
//    }
    
    // End editing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("DEBUG: - \(#function)")
        delegate?.didEndEditing(self, withTextField: textField)
    }
}


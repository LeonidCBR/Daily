//
//  MenuOptionCell.swift
//  Daily
//
//  Created by Яна Латышева on 09.03.2021.
//  Copyright © 2021 Motodolphin. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    // MARK: - Properties
    
    var menuOption: MenuOption? {
        didSet {
            configure()
        }
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.tintColor = .white
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .mainBlue
        
        contentView.addSubview(iconImageView)
        iconImageView.anchor(leading: contentView.leadingAnchor, paddingLeading: 20.0,
                             width: 24.0,
                             height: 24.0,
                             centerY: contentView.centerYAnchor)
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.anchor(leading: iconImageView.trailingAnchor, paddingLeading: 20.0,
                                centerY: contentView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    private func configure() {
        print("DEBUG: configure menu option")
        guard let option = menuOption else { return }
        descriptionLabel.text = option.description
        iconImageView.image = option.image
    }
    
    
    /*
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

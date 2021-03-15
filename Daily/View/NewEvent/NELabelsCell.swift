//
//  NewEventLabelsCell.swift
//  Daily
//
//  Created by Яна Латышева on 27.07.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit


class NELabelsCell: UITableViewCell {
    
    // MARK: - Properties
    let leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .mainBlue
        clipsToBounds = true
        
        contentView.addSubview(leftLabel)
        leftLabel.anchor(leading: contentView.layoutMarginsGuide.leadingAnchor,
                         centerY: contentView.centerYAnchor)
        
        contentView.addSubview(rightLabel)
        rightLabel.anchor(trailing: contentView.layoutMarginsGuide.trailingAnchor,
                          centerY: contentView.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
}


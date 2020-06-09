//
//  EventCell.swift
//  Daily
//
//  Created by Яна Латышева on 09.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    let eventText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemTeal
        
        addSubview(eventText)
        eventText.anchor(leading: leadingAnchor, paddingLeading: 20,
                         centerY: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

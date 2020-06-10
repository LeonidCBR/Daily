//
//  EventCell.swift
//  Daily
//
//  Created by Яна Латышева on 09.06.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    // MARK: - Properties
    static let circleR = 5
    
    let colorCircle: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = CGFloat(circleR)
        return view
    }()
    
    let eventText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemTeal
        
        addSubview(colorCircle)
        colorCircle.anchor(leading: leadingAnchor, paddingLeading: 20,
                           width: CGFloat(EventCell.circleR * 2), height: CGFloat(EventCell.circleR * 2),
                           centerY: centerYAnchor)
        
        addSubview(eventText)
        eventText.anchor(leading: colorCircle.trailingAnchor, paddingLeading: 20,
                         centerY: centerYAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
}

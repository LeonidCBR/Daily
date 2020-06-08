//
//  DateCell.swift
//  Daily
//
//  Created by Яна Латышева on 21.03.2020.
//  Copyright © 2020 Motodolphin. All rights reserved.
//

import UIKit
import JTAppleCalendar

class DateCell: JTACDayCell { //JTACMonthCell
    
    // MARK: - Properties
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //print("init cell...")        
        
        backgroundColor = .systemTeal
        selectedBackgroundView = UIView(frame: frame)
        selectedBackgroundView?.layer.cornerRadius = frame.height / 2
//        selectedBackgroundView.backgroundColor = .white
        selectedBackgroundView?.layer.borderWidth = 5.0
        selectedBackgroundView?.layer.borderColor = UIColor.white.cgColor
        //print("width = \(selectedBackgroundView.frame.width)")
        //print("height = \(selectedBackgroundView.frame.height)")
        
//        isSelected = true
        
        addSubview(dateLabel)
        dateLabel.anchor(centerX: centerXAnchor, centerY: centerYAnchor)
//        dateLabel.translatesAutoresizingMaskIntoConstraints = false
//        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

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
        if let selectedBackgroundView = selectedBackgroundView {
            selectedBackgroundView.layer.cornerRadius = selectedBackgroundView.frame.height / 2
            selectedBackgroundView.backgroundColor = .white
            //print("width = \(selectedBackgroundView.frame.width)")
            //print("height = \(selectedBackgroundView.frame.height)")
        }
//        isSelected = true
        
        addSubview(dateLabel)
        dateLabel.anchor(centerX: centerXAnchor, centerY: centerYAnchor)
//        dateLabel.translatesAutoresizingMaskIntoConstraints = false
//        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
